module Server.Handler where

import Prelude

import Data.Either (Either(..))
import Effect.Aff (Aff)
import Effect.Aff as EA
import Effect.Class (liftEffect)
import Effect.Console as EC
import Payload.ResponseTypes (Response)
import Run as R
import Run.Except as RE
import Run.Reader as RR
import Server.InternalError.Handler as SIEH
import Server.Landing.Handler as SLH
import Server.Types (ResponseError(..), ServerEffect, ServerReader)

handlers ∷ ServerReader → _
handlers reading =
      { landing: runHtml reading SLH.landing
      }

runHtml ∷ ∀ a b. ServerReader → (a → ServerEffect b) → a → Aff (Either (Response String) b)
runHtml reading handler input = run `EA.catchError` catch
      where
      run = R.runBaseAff' <<< RE.catch requestError <<< RR.runReader reading <<< map Right $ handler input
      catch = liftEffect <<< map Left <<< SIEH.internalError <<< EA.message
      requestError ohno = do
            R.liftEffect do
                  EC.log $ "server error " <> show ohno
                  map Left $ case ohno of
                        BadRequest { reason } → SIEH.internalError reason
-- InternalError { reason } → SIEH.internalError reason
-- ExpiredSession → pure $ SL.logout (routes.login.get {}) ""