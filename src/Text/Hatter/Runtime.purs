module Text.Hatter.Runtime
       ( Coerce
       , coerce ) where

class Coerce a b where
  coerce :: a -> b

