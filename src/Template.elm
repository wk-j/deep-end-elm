module Template exposing (..)

import Html exposing (Html, button, div, text, span, header, footer, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (classList, class)

type Optional a = Some a | None

headerN = 
    header 
        [ class "toolbar toolbar-header" ] 
        [ div [ class "toolbar-actions" ] []
        , button [ class "btn btn-default pull-right"] 
            [span [ class "icon icon-facebook"] []]
        ]

footerN = 
    footer 
        [class "toolbar toobar-footer"]
        [ h1 [class "title"] [] ]

contentN = 
    div 
        [class "window-content"]
        []

windowN = 
    div 
        [ class "window" ]
        [ headerN
        , contentN
        , footerN ]