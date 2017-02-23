module Text.Hatter.Runtime
  ( class ToVTree, toVTree
  , class ToVTrees, toVTrees
  , Attribute(), attr
  , unionAttributes
  , vnode
  , module VTree, module String, module Foldable
  ) where

import Prelude (id, (<<<))
import Data.Foreign (Foreign, toForeign)
import Data.String (joinWith) as String
import Data.Foldable (fold) as Foldable
import VirtualDOM.VTree (TagName, VTree, vnode) as V
import VirtualDOM.VTree (vtext) as VTree

foreign import unionAttributes :: Array Attribute -> forall props. { | props }

vnode :: V.TagName -> Array Attribute -> Array V.VTree -> V.VTree
vnode tag as vs = V.vnode tag (unionAttributes as) vs

newtype Attribute = Attribute Foreign

attr :: forall props. { | props } -> Attribute
attr = Attribute <<< toForeign

class ToVTree a where
  toVTree :: a -> V.VTree

instance vtreeToVTree :: ToVTree V.VTree where
  toVTree = id

instance stringToVTree :: ToVTree String where
  toVTree = VTree.vtext

class ToVTrees a where
  toVTrees :: a -> Array V.VTree

instance vtreesToVTrees :: ToVTrees (Array V.VTree) where
  toVTrees = id

instance vtreeToVTrees :: ToVTrees V.VTree where
  toVTrees v = [v]

instance stringToVTrees :: ToVTrees String where
  toVTrees s = [ VTree.vtext s ]
