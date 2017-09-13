module MultiCards exposing (..)

import Html
import Html.Attributes
import Cards


-- list is of cards and whether they're clickable


renderVisibleHand : (Cards.Card -> msg) -> List ( Cards.Card, Bool ) -> List (Cards.CardAndContext msg)
renderVisibleHand baseMsg cardPairs =
    List.map2
        (\ind cardPair ->
            let
                card =
                    Tuple.first cardPair

                canClick =
                    Tuple.second cardPair
            in
                { card = Tuple.first cardPair
                , visible = True
                , hoverClass = Just "hover-float-up"
                , click = Just <| baseMsg (Tuple.first cardPair)
                , top = "50vh"
                , left = ((toString (ind * 80)) ++ "px")
                }
        )
        (List.range 0 <| List.length cardPairs)
        cardPairs
