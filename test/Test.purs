module Test where

import Test.QuickCheck
import Control.Monad.Eff
import Debug.Trace

import Text.Hatter.Runtime
import Text.Hatter.Runtime.Instances
import VirtualDOM.VTree
import VirtualDOM.Typed

main = testAll

testAll :: QC Unit
testAll = do
  compileOk $ (coerce "hoge" :: VTree)

compileOk :: forall a. a -> QC Unit
compileOk _ = assert true

assert :: Boolean -> QC Unit
assert = quickCheck' 1
