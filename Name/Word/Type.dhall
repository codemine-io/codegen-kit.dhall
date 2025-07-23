let Prelude = ./Prelude.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.LatinChar

in  Prelude.NonEmpty.Type Char.Type
