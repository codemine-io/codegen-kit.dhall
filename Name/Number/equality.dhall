let Number = ./Type.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.Digit

let Equality = Lude.Algebras.Equality

in    Lude.Extensions.NonEmpty.equality Char.Type Char.equality
    : Equality.Type Number
