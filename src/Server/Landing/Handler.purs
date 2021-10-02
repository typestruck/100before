module Server.Landing.Handler where

import Prelude

import Payload.Headers as PH
import Payload.ResponseTypes (Response)
import Payload.Server.Response as PSR
import Server.Landing.Template as SLT
import Server.Response as SR
import Server.Types (ServerEffect)
import Shared.Routes (Html, Ok)

landing ∷ ∀ r. { | r } → ServerEffect Html
landing _ = SR.serveTemplate SLT.template