module Game exposing (..)

import Html exposing (..)
import Random exposing (..)
import Cards exposing (..)
import CardStructures exposing (..)


type alias GameModel =
    { discard : List Cards.Card
    , deck : List Cards.Card
    , hands : List Hand
    }


type Hand
    = Visible List Cards.Card
    | Hidden Int


type GameMsg
    = DeckDraw Int
    | DeckClick
    | HandClick Cards.Card


updateGameState : GameMsg -> GameModel -> ( GameModel, Cmd GameMsg )
updateGameState msg model =
    case msg of
        DeckDraw ind ->
            ( model, Cmd.none )

        DeckClick ->
            ( model
            , Random.generate
                DeckDraw
              <|
                Random.int 0 <|
                    List.length model.deck
            )

        HandClick card ->
            ( model, Cmd.none )


renderGameState : GameModel -> Html GameMsg
renderGameState model =
    div [] []
