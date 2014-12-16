module Text.Hatter.Runtime
       ( Coerce
       , coerce ) where

class Coerce a b where
  coerce :: a -> b

instance idCoerce :: Coerce a a where
  coerce = id
