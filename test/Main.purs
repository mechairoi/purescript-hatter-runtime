module Test.Main where

import Test.QuickCheck (QC, quickCheck')
import Prelude (Unit, bind, discard, not, ($))

import Text.Hatter.Runtime (vnode, toVTree, attr, toVTrees)
import VirtualDOM (PatchObject, diff) as V
import VirtualDOM.VTree (vnode, vtext) as V

main = testAll

testAll :: forall eff. QC eff Unit
testAll = do
  assert $ isEmptyPatchObject $ V.diff (V.vtext "hoge") (toVTree "hoge")
  assert $ isEmptyPatchObject $ V.diff
      (vnode "div" [ (attr { a: 1 }), (attr { b: 2 }), (attr { a: true }) ] [])
      (V.vnode "div" { a: true, b: 2 } [])
  assert $ not $ isEmptyPatchObject $ V.diff
      (V.vnode "div" { a: true } []) (V.vnode "div" { a: false } [])

  let div = V.vnode "div" { a: true } []
  assert $ isEmptyPatchObject $ V.diff
    (V.vnode "div" {} (toVTrees [div, div])) (V.vnode "div" {} [div, div])

compileOk :: forall a eff. a -> QC eff Unit
compileOk _ = assert true

assert :: forall eff. Boolean -> QC eff Unit
assert = quickCheck' 1

foreign import isEmptyPatchObject :: V.PatchObject -> Boolean
