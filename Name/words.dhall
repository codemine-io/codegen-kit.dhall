let Prelude = ../Prelude.dhall

let Name = ./Type.dhall

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
          ( Prelude.List.concatMap
              (List LatinChar.Type)
              Name
              ( \(list : List LatinChar.Type) ->
                  merge
                    { None = [] : List Name
                    , Some =
                        \(latinChars : LatinChars.Type) ->
                          [ fromLatinChars latinChars ]
                    }
                    (Lude.Extensions.List.uncons LatinChar.Type list)
              )
              tail
          )
      : Name
