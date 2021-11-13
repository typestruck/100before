module Server.Handler where

import Prelude

import Data.Either (Either(..))
import Data.List (List(..))
import Data.List as DL
import Data.String as DS
import Effect.Aff (Aff)
import Effect.Aff as EA
import Effect.Class (liftEffect)
import Effect.Console as EC
import Payload.ResponseTypes (Response)
import Payload.Server.Handlers (File)
import Payload.Server.Handlers as PSH
import Run as R
import Run.Except as RE
import Run.Reader as RR
import Server.InternalError.Handler as SIEH
import Server.Landing.Handler as SLH
import Server.Types (ResponseError(..), ServerEffect, ServerReader)

handlers ∷ ServerReader → _
handlers reading =
      { landing: runHtml reading SLH.landing
            , developmentFiles: developmentFiles

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

developmentFiles ∷ { params ∷ { path ∷ List String } } → Aff File
developmentFiles { params: { path } } = PSH.file fullPath {}
      where
      clientBaseFolder = "src/Client/"
      distBaseFolder = "dist/development/"
      fullPath = case path of
            Cons "media" (Cons file Nil) → clientBaseFolder <> "media/" <> file
            Cons "media" (Cons "upload" (Cons file Nil)) → clientBaseFolder <> "media/upload/" <> file
            --js files are expected to be named like module.bundle.js
            -- they are served from webpack output
            Cons "javascript" (Cons file Nil) → distBaseFolder <> file
            Cons folder (Cons file Nil) → clientBaseFolder <> folder <> "/" <> file
            _ → distBaseFolder <> DS.joinWith "/" (DL.toUnfoldable path)