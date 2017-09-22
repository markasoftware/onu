module CardStructures exposing (..)

import Cards exposing (..)
import Util exposing (..)


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
    Util.enumMap
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


type alias HiddenHand =
    { top : String
    , left : Int
    , cards : List (Maybe Cards.Card)
    , spacing : Int
    , leftUnit : String
    }


genHiddenHand : HiddenHand -> List (CardAndContext msg)
genHiddenHand hand =
    let
        cards =
            List.map (Maybe.withDefault { color = Nothing, rank = Wild }) hand.cards
    in
        Util.enumMap
            (\card ind ->
                { card = card
                , visible = False
                , hoverClass = Nothing
                , click = Nothing
                , top = hand.top
                , left = (toString <| hand.left + hand.spacing * ind) ++ hand.leftUnit
                }
            )
            cards
