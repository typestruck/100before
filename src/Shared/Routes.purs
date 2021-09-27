module Shared.Routes where

import Prelude

import Data.List (List)
import Data.Maybe (Maybe)
import Payload.Server.Handlers (File)
import Payload.Spec (type (:), GET, Guards, Nil, POST, Routes, Spec(..))

routes ∷
      Spec
            { guards ∷
                    {
                    }
            , routes ∷
                    { landing ∷
                            GET "/"
                                  { response ∷ Html
                                  }
                    }
            }
routes = Spec