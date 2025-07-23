let Number = ../Number/package.dhall

let Lude = ../../Lude.dhall

let Word = Lude.Structures.LatinChars

in  ./fold.dhall Text Word.toTextInLower Number.toText
