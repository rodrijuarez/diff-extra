module Diff.Extra exposing (diffWords, simplifiedDiffWords)

import Diff exposing (Change(..))
import String exposing (words)


diffWords : String -> String -> List (Change String)
diffWords a b =
    Diff.diff (words (a)) (words (b))


simplifiedDiffWords : String -> String -> List (Change String)
simplifiedDiffWords a b =
    simplifyChanges (diffWords a b)


simplifyChanges : List (Change String) -> List (Change String)
simplifyChanges a =
    case a of
        [] ->
            []

        b :: [] ->
            a

        (NoChange c) :: (NoChange d) :: rest ->
            simplifyChanges (NoChange (c ++ d) :: rest)

        (Added c) :: (Added d) :: rest ->
            simplifyChanges (Added (c ++ d) :: rest)

        (Removed c) :: (Removed d) :: rest ->
            simplifyChanges (Removed (c ++ d) :: rest)

        first :: second :: rest ->
            first :: simplifyChanges (second :: rest)
