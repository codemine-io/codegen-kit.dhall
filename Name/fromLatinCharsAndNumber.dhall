let Name = ./Type.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let Lude = ../Lude.dhall

let LatinChars = Lude.Structures.LatinChars

in  \(latinChars : LatinChars.Type) ->
    \(number : Natural) ->
      { head = latinChars, tail = [ WordOrNumber.Type.Number number ] } : Name
