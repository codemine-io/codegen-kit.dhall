let Self = ./Type.dhall

let Lude = ../../../../Lude.dhall

let order = ./order.dhall

in  Lude.Algebras.Order.toEquality Self order : Lude.Algebras.Equality.Type Self
