module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Template 

type alias Model = Int
type Msg = Increase | Decrease

model : Model
model = 0

update : Msg -> Model -> Model
update  msg model = 
    case msg of 
        Increase -> model + 1
        Decrease -> model - 1

view : Model -> Html Msg
view model = 
    Template.windowN

    {-
    div []
        [ button [onClick Decrease] [text "-"]
        , div [] [text (toString model)]
        , button [onClick Increase] [text "+"]
        ]
    -}

main : Program Never Model Msg
main = Html.beginnerProgram { model = model, view = view, update = update }