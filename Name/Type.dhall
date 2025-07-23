let Lude = ../Lude.dhall

let Word = Lude.Structures.LatinChars

let WordOrNumber = ./WordOrNumber/package.dhall

in  { head : Word.Type, tail : List WordOrNumber.Type }
