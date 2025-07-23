let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Lude = ../../Lude.dhall

let Word = Lude.Structures.LatinChars

in  \(Out : Type) ->
    \(fromWord : Word.Type -> Out) ->
    \(fromNumber : Natural -> Out) ->
    \(self : Self) ->
      merge { Word = fromWord, Number = fromNumber } self
