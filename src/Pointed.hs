{-# OPTIONS
 
 -XFlexibleInstances

#-}

module Pointed where

import qualified Data.Set as S
import qualified Data.Map.Strict as M
import qualified Data.Graph.Inductive as G
import Data.Tree
import Prelude -- necessary for Hint.

--TODO: automatically derive for records

class Pointed a where
  point :: a

instance Pointed (M.Map a b) where
  point = M.empty

instance Pointed [a] where
  point = []

instance Pointed (S.Set a) where
  point = S.empty

instance Pointed (a -> a) where
  point = id

instance (Pointed a, Pointed b) => Pointed (a,b) where
  point = (point, point)

instance Pointed (G.Gr a b) where
  point = G.empty

instance Pointed a => Pointed (Tree a) where
  point = Node point []

instance Pointed Int where
  point = 0
