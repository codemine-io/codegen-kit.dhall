let Number = ./Type.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.LatinChar

let Order = Lude.Algebras.Order

in  Lude.Extensions.NonEmpty.order Char.Type Char.order : Order.Type Number
