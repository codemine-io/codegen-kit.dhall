let Prelude = ../Prelude.dhall

let Name = ./Type.dhall

let Lude = ../Lude.dhall

let LatinChars = Lude.Structures.LatinChars

let Self = ./Type.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  \(name : Self) ->
        (let head = WordOrNumber.Type.Word name.head in [ head ] # name.tail)
      : List WordOrNumber.Type
