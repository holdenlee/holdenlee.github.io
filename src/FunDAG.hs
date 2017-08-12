{-# OPTIONS
 
 -XMultiParamTypeClasses
 -XFunctionalDependencies
 -XFlexibleInstances
 -XFlexibleContexts
 -XUndecidableInstances
 -XTupleSections
#-}

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module FunDAG where
import qualified Data.Map as M
import Control.Lens hiding (children, (|>))
import Control.Monad
import Control.Monad.State
import Control.Monad.Trans
import Control.Monad.Writer
import Control.Monad.Identity
import Control.Monad.RWS
import Utilities
import Search
import MonadSupply
--import Pointed

import Data.Tree
import Data.List

--I'm using this instead of fgl because it's more lightweight
type FunDAG l = (l, M.Map l ([l],[l]))
--make this a newtype?

{-instance Pointed l => Pointed (FunDAG l) where
    point = (point, M.empty)-}

insertParentAndChildren :: Ord l => l -> [l] -> FunDAG l -> FunDAG l 
insertParentAndChildren parent children fd = 
    let 
        fd' = insertParent parent children fd
    in
      fd' |> foldIterate (\c f -> insertChild parent c f) children

insertParent :: (Ord l) => l -> [l]  -> FunDAG l -> FunDAG l
insertParent parent children (l,m) = 
    case M.lookup parent m of
      Nothing -> (l, m & M.insert parent (children, []))
      Just _ -> (l, m & M.adjust (_1 %~ (++children)) parent)
    
insertChild :: Ord l => l -> l -> FunDAG l -> FunDAG l
insertChild parent child (l,m) = 
    case M.lookup child m of
      Nothing -> (l, m & M.insert child ([], [parent]))
      Just _ -> (l, m & M.adjust (_2 %~ (++[parent])) child)


getAllChildren :: Ord l => l -> FunDAG l -> [l]
getAllChildren x ft@(l, m) = 
    case M.lookup x m of
      Nothing -> []
      Just (li, _) -> li++(concat (map (\x1 -> getAllChildren x1 ft) li))


{-
--I'm using this instead of fgl because it's more lightweight
type FunDAG l b = (l, M.Map l (b,[l],[l]))
--make this a newtype?

insertParentAndChildren :: l -> [l] -> FunDAG l b -> FunDAG l b
insertParentAndChildren parent children fd = 
    

insertNode :: l -> [l] -> b -> FunDAG l b -> FunDAG l b
insertNode child parents name fd = 
    let 
        fd' = insertChild child parents name fd
    in
      fd' |> foldIterate (\p f -> insertParent child p name f) parents

insertChild :: l -> [l] -> b -> FunDAG l b -> FunDAG l b
insertChild child parents name (l,m) = 
    case M.lookup child m of
      Nothing -> (l, m & M.insert child (name, [], parents))
      Just _ -> (l, m & M.adjust (_1 ^. name & _3 ^. parents))

insertParent :: l -> [l] -> b -> FunDAG l b -> FunDAG l b
insertParent parent children name (l,m) = 
    case M.lookup parent m of
      --warning: b is undefined! If error, check for missing parent.
      Nothing -> (l, m & M.insert parent (undefined, children, []))
      Just _ -> (l, m & M.adjust (_2 %~ (++children)))

getAllChildren :: l -> FunTree l b -> [b]
getAllChildren x ft@(l, m) = 
    case M.lookup x m of
      Nothing -> []
      Just (b, li) -> b:(concat (map (\x1 -> getAllChildren x1 ft) li))
-}
