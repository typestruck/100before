module Shared.Routes where

import Prelude

import Data.List (List)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Payload.ContentType (html)
import Payload.Headers as PH
import Payload.ResponseTypes as PR
import Payload.Server.Handlers (File)
import Payload.Server.Response (class EncodeResponse)
import Payload.Spec (type (:), GET, Guards, Nil, POST, Routes, Spec(..))

type Ok = Record ()

newtype Html = Html String

derive instance Newtype Html _

instance EncodeResponse Html where
      encodeResponse (PR.Response { status, headers, body: Html contents }) = pure $ PR.Response
            { headers: PH.setIfNotDefined "content-type" html headers
            , body: PR.StringBody contents
            , status
            }


routes ∷
      Spec
            { guards ∷ {}
            , routes ∷
                    { landing ∷
                            GET "/"
                                  { response ∷ Html
                                  }
                    }
            }
routes = Spec