module Server.Main where

import Prelude

import Effect.Aff as EA
import Payload.Server (defaultOpts)
import Payload.Server as PS
import Server.Handler as SH
import Effect.Console as EC
import Effect (Effect)
import Shared.Routes (routes)

main ∷ Effect Unit
main = do
      let port = 8080
      EA.launchAff_ $ PS.startGuarded (defaultOpts { port = port }) routes
            { guards: {}
            , handlers: SH.handlers {}
            }
