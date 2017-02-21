module Text.Hatter.Runtime (class Coerce, coerce) where

import VirtualDOM.VTree as V
import Prelude

class Coerce a b where
  coerce :: a -> b

instance idCoerce :: Coerce a a where
  coerce = id

instance stringNodeCoerce :: Coerce String V.VTree where
  coerce s = V.vtext s

instance nodesCoerce :: Coerce V.VTree (Array V.VTree) where
  coerce a = [a]
