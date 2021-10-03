{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "100before"
, license = "AGPL-3.0-or-later"
, repository = "https://github.com/melanchat/100before"
, dependencies =
  [ "aff"
  , "console"
  , "effect"
  , "either"
  , "flame"
  , "lists"
  , "maybe"
  , "newtype"
  , "payload"
  , "prelude"
  , "psci-support"
  , "run"
  , "strings"
  , "tuples"
  , "typelevel-prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
