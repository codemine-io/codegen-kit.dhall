let Prelude = ../Prelude.dhall

let Name = ./Type.dhall

let Lude = ../Lude.dhall

let LatinChars = Lude.Structures.LatinChars

let Self = ./Type.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let toWordOrNumberList = ./toWordOrNumberList.dhall

in  \(head : Self) ->
    \(tail : List Self) ->
        { head = head.head
        , tail =
              head.tail
            # Prelude.List.concatMap
                Self
                WordOrNumber.Type
                toWordOrNumberList
                tail
        }
      : Self
