import Html exposing (Html, div, button, text)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick)
import String


main =
  beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Task = { task : String, complete : Bool }

tasks : List Task
tasks =
  [
    { task = "Buy milk", complete = True }
    , { task = "Drink milk", complete = False }
  ]

type alias Model = String

model : Model
model =
  ""


-- UPDATE

type Visibility = All | Active | Completed

update : Visibility -> Model -> Model
update msg model =
  (case msg of
    All ->
      tasks
    Active ->
      List.filter (\task -> not task.complete) tasks
    Completed ->
      List.filter (\task -> task.complete) tasks)
  |> List.map .task |> String.join " and "

-- VIEW

view : Model -> Html Visibility
view model =
  div []
    [ button [ onClick All ] [ text "All" ]
    , button [ onClick Active ] [ text "Active" ]
    , button [ onClick Completed ] [ text "Completed" ]
    , div [] [ text (toString model) ]
    ]
