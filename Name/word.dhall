let Name = ./Type.dhall

let Lude = ../Lude.dhall

let LatinChar = Lude.Structures.LatinChar

in  \(wordHead : LatinChar.Type) ->
    \(wordTail : List LatinChar.Type) ->
      let latinChars = { head = wordHead, tail = wordTail }

      in  ./fromLatinChars.dhall latinChars : Name
