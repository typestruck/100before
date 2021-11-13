module Shared.Landing.Template where

import Prelude

import Flame.Html.Attribute as HA
import Flame.Html.Element as HE

template = HE.div (HA.class' "sign-up")
      [ HE.h1 (HA.id "headline") "100before"
      , HE.h4 (HA.class' "subheadline")
              [ HE.text "Things to do "
              , HE.i_ " before "
              , HE.text "you die"
              ]
      , HE.div (HA.class' "form-up")
              [ HE.div [ HA.id "email-input", HA.class' "input" ]
                      [ HE.label_ "Email"
                      , HE.input [ HA.type' "text", HA.id "email" ]
                      , HE.span (HA.class' "error-message") "Please enter a valid email"
                      ]
              , HE.div [ HA.id "password-input", HA.class' "input" ]
                      [ HE.label_ "Password"
                      , HE.input [ HA.type' "password", HA.autocomplete "new-password", HA.id "password" ]
                      , HE.span (HA.class' "error-message") $ "Password must be characters or more"
                      ]
              , HE.div [ HA.class' "input" ]
                      [ HE.div' [ HA.class' "g-recaptcha", HA.createAttribute "data-sitekey" "6LeDyE4UAAAAABhlkiT86xpghyJqiHfXdGZGJkB0", HA.id "captcha", HA.createAttribute "data-callback" "completeRegistration", HA.createAttribute "data-size" "invisible" ]
                      , HE.input [ HA.type' "button", HA.value "Create account" ]
                      , HE.span' [ HA.class' "request-error-message error-message" ]
                      ]
              ]
      ]