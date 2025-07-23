let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Lude = ../../Lude.dhall

let Char = Lude.Structures.Digit

in  \(self : Self) ->
          Char.toText self.head
      ++  Prelude.Text.concatMap Char.Type Char.toText self.tail
