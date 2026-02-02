let Self = ./Type.dhall

let Lude = ../../Lude.dhall

let Typeclasses = ../../Typeclasses.dhall

let Ordering = Typeclasses.Classes.Ordering

let Word = Lude.Structures.LatinChars

let OrderType = < Less | Equal | Greater >

let compareNatural =
      \(left : Natural) ->
      \(right : Natural) ->
        if    Natural/isZero (Natural/subtract right left)
        then  if    Natural/isZero (Natural/subtract left right)
              then  OrderType.Equal
              else  OrderType.Greater
        else  OrderType.Less

let compare =
      \(left : Self) ->
      \(right : Self) ->
        merge
          { Number =
              \(left : Natural) ->
                merge
                  { Number = \(right : Natural) -> compareNatural left right
                  , Word = \(right : Word.Type) -> OrderType.Less
                  }
                  right
          , Word =
              \(left : Word.Type) ->
                merge
                  { Number = \(right : Natural) -> OrderType.Greater
                  , Word = \(right : Word.Type) -> Word.order.order left right
                  }
                  right
          }
          left

in  { order = compare } : Ordering.Type Self
