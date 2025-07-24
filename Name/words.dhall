let Prelude = ../Prelude.dhall

let Self = ./Type.dhall

let Lude = ../Lude.dhall

let LatinChar = Lude.Structures.LatinChar

let LatinChars = Lude.Structures.LatinChars

let word = ./word.dhall

let concat = ./concat.dhall

let fromLatinChars = ./fromLatinChars.dhall

in  \(headHead : LatinChar.Type) ->
    \(headTail : List LatinChar.Type) ->
    \(tail : List (List LatinChar.Type)) ->
        concat
          (word headHead headTail)
          ( Prelude.List.filterMap
              (List LatinChar.Type)
              Self
              ( \(list : List LatinChar.Type) ->
                  Prelude.Optional.map
                    LatinChars.Type
                    Self
                    fromLatinChars
                    (Lude.Extensions.List.uncons LatinChar.Type list)
              )
              tail
          )
      : Self
