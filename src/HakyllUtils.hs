--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, TupleSections #-}
module HakyllUtils where
import           Data.Monoid
import qualified Data.Set as S
import           Hakyll
import           Text.Pandoc.Options
import           System.FilePath (takeBaseName, takeDirectory, joinPath, splitPath)
import           Control.Lens hiding (Context)
import           Control.Monad
import           Data.List
import qualified Data.Map as M
import qualified Data.MultiMap as MM
import           Text.Printf
--import qualified Data.Tree as T
import Debug.Trace
import Utilities
--import FunTree

postItemTemplate :: Template
postItemTemplate = readTemplate "<li><a href=\"$url$\">$title$</a> ($date$)$if(subtitle)$: <span class=\"italic\">$subtitle$</span> $endif$</li>"

sortByField :: (Ord b) => (String -> b) -> String -> [Item a] -> Compiler [Item a]
sortByField f field listItems = do
  listItemFields <- forM listItems (flip getMetadataField field . itemIdentifier)
  return $ map snd $ sortBy (\x y -> compare (fmap f $ fst x) (fmap f $ fst y)) $ zip listItemFields listItems
