module Client.Native.Main where

import Prelude

import Flame ((:>))
import Flame.Application.EffectList as F
import Flame.Application.EffectList as FAE
import Shared.Landing.Template as SLT

main = FAE.mountNative_
      { view : \a -> SLT.template
      , update : \a b → F.noMessages a
      , init : {} :> []
      , subscribe : []
      , name : "hbefore"
      }