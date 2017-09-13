module Cards exposing (..)

import Html exposing (..)
import Html.Keyed exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Util exposing (..)


type alias Card =
    { color : Maybe CardColor
    , rank : CardRank
    }


type alias CardAndContext msg =
    { card : Card
    , visible : Bool
    , hoverClass : Maybe String
    , click : Maybe msg
    , left : String
    , top : String
    }


type CardColor
    = Red
    | Green
    | Yellow
    | Blue


type CardRank
    = Numerical Int
    | Wild
    | Draw2
    | Draw4
    | Skip
    | Switch


renderCard : CardAndContext msg -> Html msg
renderCard card =
    let
        hoverClass =
            Maybe.withDefault "" card.hoverClass

        clickAttr =
            Util.maybe (attribute "noop" "noop") (\x -> onClick x) card.click

        styleAttr =
            style
                [ ( "left", card.left )
                , ( "top", card.top )
                ]

        classAttr =
            classList
                [ ( "card", True )
                , ( hoverClass, True )
                , ( "flipped", not card.visible )
                ]
    in
        div
            [ styleAttr, clickAttr, classAttr ]
            ((renderRanks card.card)
                ++ [ div [ class "art-outer-wrapper" ]
                        [ div [ class "art-inner-wrapper" ] (renderArt card.card)
                        ]
                   ]
            )


renderRanks : Card -> List (Html msg)
renderRanks card =
    let
        addToClass =
            Util.maybe "" colorToString card.color
    in
        [ div [ class ("rank rank-top-left text " ++ addToClass) ]
            [ text (rankToString card.rank) ]
        , div [ class ("rank rank-bottom-right text " ++ addToClass) ]
            [ text (rankToString card.rank) ]
        ]


renderArt : Card -> List (Html msg)
renderArt card =
    Util.maybe
        [ text "Not ready for colorless cards yet, sorry :(" ]
        (\color ->
            case card.rank of
                Numerical num ->
                    List.repeat num
                        (div
                            [ classList
                                [ ( "numerical-art-row", True )
                                , ( "bg", True )
                                , ( colorToString color, True )
                                ]
                            ]
                            []
                        )

                _ ->
                    [ text "Not ready for special ranks yet, sorry :(" ]
        )
        card.color


rankToString : CardRank -> String
rankToString rank =
    case rank of
        Numerical num ->
            toString num

        Wild ->
            "W"

        Draw2 ->
            "2X"

        Draw4 ->
            "4X"

        Skip ->
            "⊘"

        Switch ->
            "⟲"


colorToString : CardColor -> String
colorToString color =
    case color of
        Green ->
            "green"

        Red ->
            "red"

        Blue ->
            "glue"

        Yellow ->
            "yellow"


serializeCard : Card -> String
serializeCard card =
    (rankToString card.rank) ++ (Util.maybe "colorless" (\x -> colorToString x) card.color)


renderCardList : List (CardAndContext msg) -> Html msg
renderCardList cards =
    Html.Keyed.node "div" [] <|
        List.map (\card -> ( serializeCard card.card, renderCard card )) cards
