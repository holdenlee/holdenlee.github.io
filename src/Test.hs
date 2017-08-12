--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, TupleSections, LambdaCase #-}
module Main where
import           Data.Monoid
import qualified Data.Set as S
--import           Hakyll
--import           Text.Pandoc.Options
import           System.FilePath (takeBaseName, takeFileName, takeDirectory, joinPath, splitPath, replaceExtension)
import           Control.Lens hiding (Context)
import           Control.Monad
import           Data.List
import qualified Data.Map as M
import qualified Data.MultiMap as MM
import           Text.Printf
--import qualified Data.Tree as T
import Debug.Trace
import Utilities
import FunTree
--import HakyllUtils
{-
setDirRoute :: String -> String -> Routes
setDirRoute folderName ext = customRoute (((folderName++"/")++) . takeFileName . toFilePath)

takeFileNameRoute :: String -> Routes
takeFileNameRoute ext =  customRoute (flip replaceExtension ext . takeFileName . toFilePath)
-}
main = do 
{-
    let t = [("math/geo", ["1.txt", "2.txt"])]
    let tagsMapList = nestCategories t
    let tagsMap' = tagsMapList & ((mapped . _1) %~ joinPath)
    putStrLn $ show tagsMap'-}
    let t = [(["A"],["posts/A/A.md"]),(["A","B"],["posts/A/B/B.md"]),(["programming","haskell"],["posts/programming/haskell/hello-hakyll.md"])]
    putStrLn $ show $ makePostTree t
    --let treeMap = treeCategories $ tagsMap categories
    --putStrLn $ show treeMap
    --let t2 = makePostTree treeMap
    --putStrLn $ show t2

{-| keep the entire directory name, cutting off the first part (which will be posts/) -}
getNestedCategory :: String -> [String]
getNestedCategory = return . joinPath . tail . splitPath . takeDirectory
--getCategory = return . return . takeBaseName . takeDirectory . toFilePath

{-
buildNestedCategories' :: MonadMetadata m => Pattern -> (String -> Identifier) -> m Tags
buildNestedCategories' = buildTagsWith (return . getNestedCategory)

buildNestedCategories :: MonadMetadata m => Pattern -> (String -> Identifier) -> m ([([String], [Identifier])], Tags)
buildNestedCategories pat f = do
  categories <- buildNestedCategories' pat f
  let tagsMapList = nestCategories $ tagsMap categories
  let tagsMap' = tagsMapList & ((mapped . _1) %~ joinPath)
  let treeMap = treeCategories $ tagsMap categories
  return (treeMap, categories{tagsMap = tagsMap'})
-}
treeCategories :: [(String, [String])] -> [([String], [String])]
treeCategories = ((mapped . _1) %~ splitPath) .&
                 ((mapped . _1 . mapped) %~ removeTrailingSlash)

nestCategories :: [(String, [String])] -> [([String], [String])]
nestCategories = (((mapped . _1) %~ splitPath) >=>
                 (\(li, y) -> map (,y) (tail $ inits li))) .&
                 ((mapped . _1) %~ removeTrailingSlashList) .&
                 reduce

(.&):: (a -> b) -> (b -> c) -> (a -> c) 
(.&) = flip (.)
  
{- As in, MapReduce -}
reduce :: (Monoid m, Ord a, Ord m) => [(a, m)] -> [(a, m)]
reduce = M.toList . M.map mconcat . MM.toMap . MM.fromList

removeTrailingSlash :: String -> String
removeTrailingSlash = reverse . (\li -> if head li == '/' then tail li else li) . reverse

removeTrailingSlashList :: [String] -> [String]
removeTrailingSlashList = reverse . (ix 0 %~ removeTrailingSlash) . reverse

makePostTree :: [([String], [String])] -> FunTree [String] [String]
makePostTree li =
  for li ([], M.singleton [] ([], [])) (\(li, ids) (rt, m) ->
--note I'm assuming there are no uncategorized posts. Otherwise you have to add a check here if li is already in the map
    (rt, m & M.insert li (ids, [])
-- I want to do this but it isn't right
-- & at (head li) . _2 .~ li
           & at (li & reversed %~ tail) %~ (\case 
                                              Nothing -> Just ([],[li])
                                              Just (x, li') -> Just (x, li:li'))))

--type FunTree l b = (l, M.Map l (b,[l]))
{-
compileTree :: Context String -> FunTree [String] [Identifier] -> Compiler String
compileTree ctx p@(rt, m) = do
  let (li, ls') = m M.! rt -- :: ([Identifier], [[String]])
  let ls = sortBy (\x y -> compare ((m M.! x) ^. _1) ((m M.! y) ^. _1)) ls'
  listItemString <- (flip loadAllSnapshots) "content" $ foldl (.||.) "" (map (fromGlob . toFilePath) li)
  postItems <- applyTemplateList postItemTemplate ctx listItemString
  childrenListStrings <- mapM (compileTree ctx) (map (,m) ls)
  let childrenOutline = mconcat $ zipWith (\catPath str -> printf "<li><b>%s</b> %s </li>" (last catPath) str) ls childrenListStrings
  -- \catPath str -> "<li><b>"++(last catPath)++"</b>"++postItems++"</li>"
  return ("<ul>"++childrenOutline++postItems++"</ul>")-}
