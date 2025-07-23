let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Lude = ../Lude.dhall

let Word = Lude.Structures.LatinChars

let WordOrNumber = ./WordOrNumber/package.dhall

in  \(self : Self) ->
          Word.toTextInTitle self.head
      ++  Prelude.Text.concatMap
            WordOrNumber.Type
            WordOrNumber.toTextInUpper
            self.tail
