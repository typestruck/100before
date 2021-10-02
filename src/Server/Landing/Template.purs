module Server.Landing.Template where

import Prelude

import Data.String as DS
import Effect (Effect)
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE
import Flame.Renderer.String as FRS
import Server.Template (defaultParameters)
import Server.Template as ST

template ∷ Effect String
template = do
      contents ← ST.template defaultParameters
            { content = content
            }
      FRS.render contents
      where
      content =
            [ HE.div_ "LANDING"
            ]
