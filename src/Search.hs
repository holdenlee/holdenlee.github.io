{-# OPTIONS
 
 -XMultiParamTypeClasses
 -XFunctionalDependencies
 -XMultiWayIf
 -XFlexibleInstances
 -XFlexibleContexts
#-}

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Search where
import System.Environment
import Data.Tree
import Control.Monad.Trans
import Control.Monad.State
import Control.Monad.Except
--import Control.Monad.Writer

import Utilities

class Treelike a b | a -> b where
      children :: a -> [a]
      root :: a -> b 
      graft :: b -> [a] -> a

node :: (Treelike a b) => b -> a
node x = graft x []

instance Treelike (Tree a) a where 
         children ta = (case ta of Node _ c -> c)
         root ta = (case ta of Node a1 _ -> a1)
         graft top ts = Node top ts

--another instance: if a is an AST.

data TNode a b = TNode {curN :: b
                       , leftN :: [a]
                       , rightN :: [a]
                       }

data SPath a b = SPath {path :: [TNode a b]
                       , curTree :: a
                       }

cur :: (Treelike a b) => SPath a b -> b
cur = root . curTree

--warning: should check path is nonempty.
lefts :: SPath a b -> [a]
lefts x = leftN (head (path x))

--warning: should check path is nonempty.
rights :: SPath a b -> [a]
rights x = rightN (head (path x))

type TPath b = SPath (Tree b) b

newtype SearchState a b c = SearchState {searchState :: StateT (SPath a b) (Except String) c} deriving (Functor, Applicative, Monad, MonadState (SPath a b), MonadError String)

type TState b c = SearchState (Tree b) b c

up :: (Treelike a b) => SearchState a b String
up = do
  spath@(SPath xpath xtree) <- get
  case xpath of
   [] -> throwError "up" --can't go up
   parentCrumb:ancestors ->
     (put $ SPath ancestors
                  (graft (curN parentCrumb) (reverse (lefts spath) ++ [xtree] ++ (rights spath))))
     >> return "up"

down :: (Treelike a b) => Int -> SearchState a b String
down n = do
  spath@(SPath xpath xtree) <- get
  let cs = children xtree
  if n < length cs && n>=0
    then (put $ SPath ((TNode (root xtree) (take n cs) (drop (n+1) cs)):xpath)
                      (cs!!n))
         >> return "down"
    else throwError "down"
