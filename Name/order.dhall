let Self = ./Type.dhall

let Lude = ../Lude.dhall

let Order = Lude.Algebras.Order

let Comparison = Order.Comparison

let Lude = ../Lude.dhall

let Word = Lude.Structures.LatinChars

let WordOrNumber = ./WordOrNumber/package.dhall

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        let comparison = Word.order.compare left.head right.head

        let handler =
              { Smaller = Comparison.Smaller
              , Greater = Comparison.Greater
              , Equal =
                  ( Lude.Extensions.List.order
                      WordOrNumber.Type
                      WordOrNumber.order
                  ).compare
                    left.tail
                    right.tail
              }

        in  merge handler comparison

in  { compare } : Order.Type Self
