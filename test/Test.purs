module Test where

import Test.QuickCheck
import Control.Monad.Eff
import Debug.Trace

import Text.Hatter.Runtime
import Text.Hatter.Runtime.Instances
import VirtualDOM.VTree.Typed

main = testAll

testAll :: QC Unit
testAll = do
  compileOk $ (coerceToVTrees "hoge")

compileOk :: forall a. a -> QC Unit
compileOk _ = assert true

assert :: Boolean -> QC Unit
assert = quickCheck' 1
