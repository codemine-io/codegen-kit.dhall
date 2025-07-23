let Prelude = ./Prelude.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.Digit

in  Prelude.NonEmpty.Type Char.Type
