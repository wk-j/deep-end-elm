module Main exposing (..)
import Html exposing (Html, button, div, text)
import Html exposing ( Html, button, div, text, span, header, footer, h1, ul, li, img, strong, p, iframe)
import Html.Events exposing (onClick)
import Html.Attributes exposing (classList, class, src, width, height)
import Html.Events exposing (onClick)

type alias Video = { title : String, source : String } 
type alias Model = { videos : List Video, currentVideo : String }
type Msg = Play String

headerN : Html msg
headerN = 
    header 
        [ class "toolbar toolbar-header"] 
        [ div   [ class "toolbar-actions" ] 
                [ button    [ class "btn btn-default pull-right" ] 
                            [span   [ class "icon icon-facebook" ] 
                                    [] 
                            ]
                ]
        ]
        
listItemN current video =
    li 
        [ classList [("list-group-item", True), ("active", current == video.source)] , onClick (Play video.source)]
        [ img   [ classList [("img-circle media-object pull-left",True)], src "images/large-round.png", width 32, height 32] 
                []
        , div   [ class "media-body"] 
                [ strong    [] 
                            [ text video.title ]
                , p         [] 
                            [ text "Jannine Weigel" ]
                ]
        ]

listGroupN model = 
    ul  [class "list-group"]
        (model.videos |> List.map (listItemN model.currentVideo))

footerN : Html msg
footerN = 
    footer 
        [class "toolbar toobar-footer"]
        [ h1 [class "title"] [] ]

contentN model = 
    div [class "window-content"]
        [ div   [ class "pane scroll" ] 
                [ (listGroupN model) ]
        , div   [ class "pane" ] 
                [ iframe    [ width 560, height 315, src model.currentVideo ] 
                            [] 
                ]
        ]

windowN model = 
    div     [ class "window" ]
            [ headerN
            , contentN model
            , footerN
            ]

-- MODEL

model : Model
model = 
    { currentVideo = "https://www.youtube.com/embed/NCXfKyfpBKI?ecver=1&autoplay=1&controls=0&showinfo=0&rel=0&modestbranding=1", 
      videos = [
            { title = "Deep End", source = "https://www.youtube.com/embed/NCXfKyfpBKI?ecver=1&autoplay=1&controls=0&showinfo=0&rel=0&modestbranding=1"} ,
            { title = "Heart Stop", source = "https://www.youtube.com/embed/lBN9VDFDvOk?ecver=1&autoplay=1&controls=0&showinfo=0&rel=0&modestbranding=1"} ,
            { title = "Strangled Love", source = "https://www.youtube.com/embed/zeP7bqMySmE?ecver=1&autoplay=1&controls=0&showinfo=0&rel=0&modestbranding=1"} 
      ]}

-- VIEW

view : Model -> Html Msg
view model = windowN model 

-- UPDATE

update : Msg -> Model -> Model 
update (Play video) model = { model | currentVideo = video }

main : Program Never Model Msg
main = Html.beginnerProgram { model = model, view = view, update = update }