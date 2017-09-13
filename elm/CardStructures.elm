module CardStructures exposing (..)

import Cards exposing (..)


type alias VisibleHand msg =
    { top : String
    , left : Int
    , cards : List Cards.Card
    , spacing : Int
    , leftUnit : String
    , click : msg
    }


genVisibleHand : VisibleHand msg -> List (CardAndContext msg)
genVisibleHand hand =
    List.map2
        (\card ind ->
            { card = card
            , visible = True
            , hoverClass = Just "hover-float-up"
            , click = Just hand.click
            , top = hand.top
            , left = (toString <| hand.left + hand.spacing * ind) ++ hand.leftUnit
            }
        )
        hand.cards
    <|
        List.range 1 <|
            List.length hand.cards
