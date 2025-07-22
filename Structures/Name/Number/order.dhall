let Number = ./Type.dhall

let Char = ./Char/package.dhall

let Lude = ../../../Lude.dhall

let Order = Lude.Algebras.Order

in  Lude.Extensions.NonEmpty.order Char.Type Char.order : Order.Type Number
