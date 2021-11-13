-- | Basic functions to compose templates.
module Server.Template where

import Prelude

import Effect (Effect)
import Flame (Html)
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE

type Parameters a =
      { title ∷ String
      , javascript ∷ Array (Html a)
      , css ∷ Array (Html a)
      , content ∷ Array (Html a)
      , footer ∷ Array (Html a)
      }

defaultParameters ∷ ∀ a. Parameters a
defaultParameters =
      { title: "100before"
      , javascript: []
      , css: []
      ,
        content: []
      , footer: []
      }

template ∷ ∀ a. Parameters a → Effect (Html a)
template = pure <<< templateWith

templateWith ∷ ∀ a. Parameters a → Html a
templateWith parameters@{ title, content, css, footer } =
      HE.html (HA.lang "en")
            [ HE.head_
                    ( [ HE.meta $ HA.charset "UTF-8"
                      , HE.meta [ HA.name "viewport", HA.content "width=device-width, initial-scale=1.0" ]
                      , HE.title title
                      ] <> styleSheets <> css
                    )
            , HE.body_ $ content <> footer <> javascript
            ]
      where
      styleSheets =
            [
            ]
      javascript =
            parameters.javascript
