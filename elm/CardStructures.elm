module CardStructures exposing (..)

import Cards exposing (..)
import Util exposing (..)


type alias BasicHand msg =
    { top : String
    , left : Int
    , cards : List Cards.Card
    , spacing : Int
    , leftUnit : String
    , click : Maybe msg
    }


genVisibleHand : BasicHand msg -> List ( Card, CardContext msg )
genVisibleHand hand =
    Util.enumMap
        (\card ind ->
            ( card
            , { visible = True
              , hoverClass = Nothing
              , click = hand.click
              , top = hand.top
              , left = (toString <| hand.left + hand.spacing * ind) ++ hand.leftUnit
              }
            )
        )
        hand.cards


genInvisibleHand : BasicHand msg -> List ( Card, CardContext msg )
genInvisibleHand hand =
    genVisibleHand hand
        |> List.map (\( card, context ) -> ( card, { context | visible = False } ))
