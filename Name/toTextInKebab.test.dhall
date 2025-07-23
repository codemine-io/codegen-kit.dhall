let subj = ./toTextInKebab.dhall

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let Number = ./Number/package.dhall

in  { singleWord =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.H
                  , tail =
                    [ Word.Char.Type.E
                    , Word.Char.Type.L
                    , Word.Char.Type.L
                    , Word.Char.Type.O
                    ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "hello"
    , multipleWords =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.H
                  , tail =
                    [ Word.Char.Type.E
                    , Word.Char.Type.L
                    , Word.Char.Type.L
                    , Word.Char.Type.O
                    ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Word.Char.Type.W
                      , tail =
                        [ Word.Char.Type.O
                        , Word.Char.Type.R
                        , Word.Char.Type.L
                        , Word.Char.Type.D
                        ]
                      }
                  , WordOrNumber.Type.Word
                      { head = Word.Char.Type.E
                      , tail =
                        [ Word.Char.Type.X
                        , Word.Char.Type.A
                        , Word.Char.Type.M
                        , Word.Char.Type.P
                        , Word.Char.Type.L
                        , Word.Char.Type.E
                        ]
                      }
                  ]
                }
          ===  "hello-world-example"
    , wordWithNumber =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.A
                  , tail = [ Word.Char.Type.P, Word.Char.Type.I ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Word.Char.Type.V
                      , tail = [] : List Word.Char.Type
                      }
                  , WordOrNumber.Type.Number
                      { head = Number.Char.Type.Two
                      , tail = [] : List Number.Char.Type
                      }
                  ]
                }
          ===  "api-v-2"
    , numberInTail =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.U
                  , tail =
                    [ Word.Char.Type.S, Word.Char.Type.E, Word.Char.Type.R ]
                  }
                , tail =
                  [ WordOrNumber.Type.Number
                      { head = Number.Char.Type.One
                      , tail = [ Number.Char.Type.Two, Number.Char.Type.Three ]
                      }
                  , WordOrNumber.Type.Word
                      { head = Word.Char.Type.N
                      , tail =
                        [ Word.Char.Type.A, Word.Char.Type.M, Word.Char.Type.E ]
                      }
                  ]
                }
          ===  "user-123-name"
    , singleCharWord =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.A, tail = [] : List Word.Char.Type }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Word.Char.Type.B
                      , tail = [] : List Word.Char.Type
                      }
                  , WordOrNumber.Type.Word
                      { head = Word.Char.Type.C
                      , tail = [] : List Word.Char.Type
                      }
                  ]
                }
          ===  "a-b-c"
    , emptyTail =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.T
                  , tail =
                    [ Word.Char.Type.E, Word.Char.Type.S, Word.Char.Type.T ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "test"
    , mixedWordsAndNumbers =
          assert
        :     subj
                { head =
                  { head = Word.Char.Type.G
                  , tail = [ Word.Char.Type.E, Word.Char.Type.T ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Word.Char.Type.U
                      , tail =
                        [ Word.Char.Type.S, Word.Char.Type.E, Word.Char.Type.R ]
                      }
                  , WordOrNumber.Type.Number
                      { head = Number.Char.Type.Four
                      , tail = [ Number.Char.Type.Two ]
                      }
                  , WordOrNumber.Type.Word
                      { head = Word.Char.Type.D
                      , tail =
                        [ Word.Char.Type.A, Word.Char.Type.T, Word.Char.Type.A ]
                      }
                  ]
                }
          ===  "get-user-42-data"
    }
