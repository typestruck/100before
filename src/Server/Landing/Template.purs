module Server.Landing.Template where

import Prelude

import Data.String as DS
import Effect (Effect)
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE
import Flame.Renderer.String as FRS
import Server.Template (defaultParameters)
import Shared.Landing.Template as SLT
import Server.Template as ST

template ∷ Effect String
template = do
      contents ← ST.template defaultParameters
            { content = content,
            css = [HE.link [ HA.rel "stylesheet", HA.type' "text/css", HA.href  $ "client/css/landing.css" ]]
            }
      FRS.render contents
      where
      content =
            [ SLT.template
            ]
