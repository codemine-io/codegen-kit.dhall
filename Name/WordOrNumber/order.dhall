let Self = ./Type.dhall

let Lude = ../../Lude.dhall

let Order = Lude.Algebras.Order

let Comparison = Order.Comparison

let Word = Lude.Structures.LatinChars

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        merge
          { Number =
              \(left : Natural) ->
                merge
                  { Number =
                      \(right : Natural) ->
                        Lude.Extensions.Natural.order.compare left right
                  , Word = \(right : Word.Type) -> Comparison.Smaller
                  }
                  right
          , Word =
              \(left : Word.Type) ->
                merge
                  { Number = \(right : Natural) -> Comparison.Greater
                  , Word = \(right : Word.Type) -> Word.order.compare left right
                  }
                  right
          }
          left

in  { compare } : Order.Type Self
