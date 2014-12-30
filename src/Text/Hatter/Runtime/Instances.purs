module Text.Hatter.Runtime.Instances where

import Data.Maybe
import qualified VirtualDOM.VTree.Typed as VT
import qualified VirtualDOM.VTree as V
import Text.Hatter.Runtime

instance vtreeCoerceToVTrees :: CoerceToVTrees V.VTree where
  coerceToVTrees a = [a]

instance maybeCoerceToVTrees :: CoerceToVTrees (Maybe V.VTree) where
  coerceToVTrees = maybe [] $ \x -> [x]

instance attributesCoerceToAttributes :: CoerceToAttributes VT.Attribute where
  coerceToAttributes a = [a]

instance maybeCoerceToAttributes :: CoerceToAttributes (Maybe VT.Attribute) where
  coerceToAttributes = maybe [] $ \x -> [x]

instance stringVTreeCoerceToVTrees :: CoerceToVTrees String where
  coerceToVTrees s = [VT.vtext s]

