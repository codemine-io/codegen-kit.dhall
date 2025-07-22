let Number = ./Type.dhall

let Char = ./Char/package.dhall

let Lude = ../../Lude.dhall

let Equality = Lude.Algebras.Equality

in    Lude.Extensions.NonEmpty.equality Char.Type Char.equality
    : Equality.Type Number
