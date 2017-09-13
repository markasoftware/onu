module Util exposing (..)

-- easy way to do one thing if a maybe is Nothing, and something else if it's Something


maybe : a -> (b -> a) -> Maybe b -> a
maybe ifNothing ifJust subject =
    case subject of
        Nothing ->
            ifNothing

        Just b ->
            ifJust b
