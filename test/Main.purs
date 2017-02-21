module Test.Main where

import Test.QuickCheck
import Control.Monad.Eff
import Debug.Trace
import Prelude

import Text.Hatter.Runtime
import VirtualDOM.VTree as V

main = testAll

testAll :: forall eff. QC eff Unit
testAll = do
  compileOk $ (coerce "hoge" :: V.VTree)

compileOk :: forall a eff. a -> QC eff Unit
compileOk _ = assert true

assert :: forall eff. Boolean -> QC eff Unit
assert = quickCheck' 1
