-- hello present people


module Main exposing (main)

import Html exposing (Html, program, div, text)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)


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
    }


init : ( Model, Cmd Msg )
init =
    ( { started = False
      }
    , Cmd.none
    )


type Msg
    = Play


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play ->
            ( { model | started = True }, Cmd.none )


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
    else
        div [] [ text "Not done yet" ]