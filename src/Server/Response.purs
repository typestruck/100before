module Server.Response where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Run as R
import Run.Except as RE
import Server.Types (BaseEffect, ServerEffect)
import Shared.Routes (Html(..))

serveTemplate ∷ Effect String → ServerEffect Html
serveTemplate template = do
      contents ← R.liftEffect template
      pure $ Html contents
