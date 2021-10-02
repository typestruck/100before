module Server.Types where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Show.Generic as DGRS
import Run (AFF, Run, EFFECT)
import Run.Except (EXCEPT)
import Run.Reader (READER)
import Type.Row (type (+))


type ServerReader = {}

type BaseEffect r a = Run (READER r + EXCEPT ResponseError + AFF + EFFECT + ()) a

type ServerEffect a = BaseEffect ServerReader a

-- | Errors that should be reported back to the user
data ResponseError
      = BadRequest { reason ∷ String }

derive instance Generic ResponseError _

instance Show ResponseError where
      show = DGRS.genericShow