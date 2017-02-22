module Text.Hatter.Runtime
  ( class ToVTree, toVTree
  , Attribute(), attr
  , unionAttributes
  , vnode
  , module VTree, module S
  ) where

import Prelude (id, (<<<))
import Data.Foreign (Foreign, toForeign)
import Data.String (joinWith) as S
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
