let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Lude = ../Lude.dhall

let Word = Lude.Structures.LatinChars

let WordOrNumber = ./WordOrNumber/package.dhall

in  \(self : Self) ->
      let headText = Word.toTextInLower self.head

      let tailTexts =
            Prelude.List.map
              WordOrNumber.Type
              Text
              WordOrNumber.toTextInLower
              self.tail

      in  Prelude.Text.concatSep "-" ([ headText ] # tailTexts)
