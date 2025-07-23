let Prelude = ../../Prelude.dhall

let Lude = ../../Lude.dhall

let Word = Lude.Structures.LatinChars

in  ./fold.dhall Text Word.toTextInLower Prelude.Natural.show
