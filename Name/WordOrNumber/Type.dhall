let Lude = ../../Lude.dhall

let Word = Lude.Structures.LatinChars

let Number = ../Number/package.dhall

in  < Number : Number.Type | Word : Word.Type >
