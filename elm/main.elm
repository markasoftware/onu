-- hello present people


module Main exposing (main)

import Html exposing (Html, program, div, text)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)
import Cards exposing (renderCard, Card, CardContext, CardColor, CardRank)
import CardStructures exposing (genVisibleHand, genInvisibleHand)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { started : Bool
    , testBool : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( { started = False
      , testBool = False
      }
    , Cmd.none
    )


type Msg
    = Play
    | Noop
    | ToggleTestBool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play ->
            ( { model | started = True }, Cmd.none )

        ToggleTestBool ->
            ( { model | testBool = not model.testBool }, Cmd.none )

        Noop ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    if not model.started then
        div [ id "start-stuff" ]
            [ div [ id "onu-logo" ] [ text "Onu" ]
            , div [ id "play-button", onClick Play ]
                [ div [ id "play-button-text" ] [ text "Play" ]
                , div [ id "blurred-play-button-background" ] []
                ]
            ]
    else if model.testBool then
        CardStructures.genInvisibleHand
            { top = "10%"
            , left = 400
            , cards =
                [ { color = Just Cards.Green
                  , rank = Cards.Skip
                  }
                ]
            , click = Nothing
            , spacing = 50
            , leftUnit = "px"
            }
            |> Cards.renderCardList
    else
        CardStructures.genVisibleHand
            { top = "50%"
            , left = 100
            , cards =
                [ { color = Just Cards.Green
                  , rank = Cards.Skip
                  }
                , { color = Just Cards.Blue
                  , rank = Cards.Numerical 5
                  }
                ]
            , click = Just ToggleTestBool
            , spacing = 50
            , leftUnit = "px"
            }
            |> Cards.renderCardList
