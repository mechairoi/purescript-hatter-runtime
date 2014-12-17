module Text.Hatter.Runtime.Instances where
import Text.Hatter.Runtime

import qualified VirtualDOM.VTree as VT
import VirtualDOM.VTree.Typed

-- data Empty = Emtpy

-- empty :: Emtpy
-- empty = Emtpy

instance stringNodeCoerce :: Coerce String VT.VTree where
  coerce s = vtext s

instance attributesCoerce :: Coerce Attribute [Attribute] where
  coerce a = [a]

instance nodesCoerce :: Coerce VT.VTree [VT.VTree] where
  coerce a = [a]
