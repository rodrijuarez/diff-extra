module Example exposing (..)

import Expect exposing (equal)
import Test exposing (..)
import Diff.Extra exposing (diffWords)
import Diff exposing (Change(..))


suite : Test
suite =
    describe "The Diff.Extra module"
        [ test "One word removed and one word added" <|
            \_ ->
                equal (diffWords "Hello" "Bye!") [ Removed "Hello", Added "Bye!" ]
        , test "One word added" <|
            \_ ->
                equal (diffWords "Hello" "Hello Joe!") [ NoChange "Hello", Added "Joe!" ]
        ]
