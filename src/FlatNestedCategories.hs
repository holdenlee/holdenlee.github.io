--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, TupleSections, LambdaCase #-}
module FlatNestedCategories where
import           Data.Char
import           Data.Monoid
import qualified Data.Set as S
import           Hakyll
import           Text.Pandoc.Options
import           System.FilePath (takeBaseName, takeFileName, takeDirectory, joinPath, splitPath, replaceExtension)
import           Control.Lens hiding (Context, (<.>))
import           Control.Monad
import           Data.List
import qualified Data.Map as M
import qualified Data.MultiMap as MM
import           Text.Printf
--import qualified Data.Tree as T
import Debug.Trace
import Utilities
import FunDAG
import HakyllUtils
import Data.Maybe
import System.FilePath



getTagsWith :: MonadMetadata m => String -> Identifier -> m [String]
getTagsWith field identifier = do
    metadata <- getMetadata identifier
    return $ fromMaybe [] $
        (lookupStringList field metadata) `mplus`
        (map trim . splitAll "," <$> lookupString field metadata)

--buildTagsWith :: MonadMetadata m => (Identifier -> m [String]) -> Pattern -> (String -> Identifier) -> m Tags
makePostTreeAndCategories :: MonadMetadata m => Pattern -> (String -> Identifier) -> m (FunDAG String, Tags)
makePostTreeAndCategories pat f = do
  categories <- buildTagsWith (getTagsWith "parent") (pat) f
                -- (getTagsWith "parent")
  let tm = (tagsMap categories)
  let ft = for' tm (("Home", M.empty)::FunDAG String) (\(tag, children) ft0 -> insertParentAndChildren tag (map (takeBaseName . toFilePath) children) ft0)
  --let dirs = M.keys (snd ft) :: [[String]]
  --let tags = map (\x -> (joinPath x, getAllChildren x ft)) dirs
  --note this is ORIGINAL not new address!!!
  let tags = map (\(x, _) -> (x, map (fromFilePath . (\x -> "posts" </> x <.> "md")) $ getAllChildren x ft)) tm
  return (ft, categories{tagsMap = tags})
  --trace (show (tagsMap categories, tags)) 
  --return (ft, categories{tagsMap = tags})       

(.&):: (a -> b) -> (b -> c) -> (a -> c) 
(.&) = flip (.)
  
--type FunTree l b = (l, M.Map l (b,[l]))
compileTree :: String -> Context String -> FunDAG String -> Compiler String
compileTree field ctx p@(rt, m) = do
  let (ls', _) = (m) M.! (rt) -- :: ([String], [String])
  let ls = sortBy (\x y -> compare (map toLower x) (map toLower y)) ls'
  --note we must put `.&&. hasNoVersion`, otherwise it tries and fails to load the toc.
  listItemString <- loadAll $ ((foldl (.||.) "" (map (fromGlob .  (<.> ".html")) ls)) .&&. hasNoVersion)
                    --map (fromGlob . toFilePath) li
--  listItemTitles <- forM listItemString (flip getMetadataField "title" . itemIdentifier)
  --sort by first
--  let listItemStringSorted = map snd $ sortBy (\x y -> compare (map toLower $ fst x) (map toLower $ fst y)) $ zip listItemTitles listItemString
  listItemStringSorted <- sortByField (map toLower) field listItemString
--(flip loadAllSnapshots) "content"  $ foldl (.||.) "" (map (fromGlob . toFilePath) li)
  postItems <- applyTemplateList postItemTemplate ctx listItemStringSorted
  childrenListStrings <- mapM (compileTree field ctx) (map (,m) ls)
  let childrenOutline = mconcat $ zipWith (\catPath str -> printf "<li><a href=\"%s.html\">%s</a> %s </li>" (catPath) (catPath) str) ls childrenListStrings
                        --"<li><b>%s</b> %s </li>" (catPath) str) ls childrenListStrings
  -- \catPath str -> "<li><b>"++(last catPath)++"</b>"++postItems++"</li>"
  return ("<ul class=\"collapsibleList\">"++childrenOutline++postItems++"</ul>")
