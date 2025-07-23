let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.LatinChar

in  \(self : Self) ->
          Char.toTextInLower self.head
      ++  Prelude.Text.concatMap Char.Type Char.toTextInLower self.tail
