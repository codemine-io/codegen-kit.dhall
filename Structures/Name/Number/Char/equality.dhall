let Self = ./Type.dhall

let Lude = ../../../../Lude.dhall

in  { equal = ./equal.dhall } : Lude.Algebras.Equality.Type Self
