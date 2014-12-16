module Text.Hatter.Runtime.Instances where
import Text.Hatter.Runtime

import VirtualDOM.VTree
import VirtualDOM.Typed

instance stringNodeCoerce :: Coerce String VTree where
  coerce s = vtext s

instance attributesCoerce :: (Attribute a) => Coerce a [a] where
  coerce a = [a]

instance nodesCoerce :: Coerce VTree [VTree] where
  coerce a = [a]
