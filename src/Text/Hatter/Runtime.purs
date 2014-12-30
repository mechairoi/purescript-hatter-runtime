module Text.Hatter.Runtime where

import qualified VirtualDOM.VTree.Typed as VT
import qualified VirtualDOM.VTree as V
import Data.Maybe

class CoerceToVTrees a where
  coerceToVTrees :: a -> [V.VTree]

instance vtreesToVTrees :: CoerceToVTrees [V.VTree] where
  coerceToVTrees = id

class CoerceToAttributes a where
  coerceToAttributes :: a -> [VT.Attribute]

instance attributesCoerceToAttributes :: CoerceToAttributes [VT.Attribute] where
  coerceToAttributes = id

class CoerceToString a where
  coerceToString :: a -> String

instance stringCoerceToString :: CoerceToString String where
  coerceToString = id
