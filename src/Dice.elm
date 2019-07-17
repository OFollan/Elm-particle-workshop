import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Random


-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = (\_ -> Sub.none)
    , view = view
    }


-- MODEL

type alias Model =
  { dieFace : Int
  }

value : Random.Generator Int
value = Random.constant 2

init : () -> (Model, Cmd Msg)
init _ =
  ( Model 1
  , Cmd.none
  )


-- UPDATE

type Msg
  = Roll
  | NewFace Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      ( model
      , Random.generate NewFace (value)
      --, Random.generate NewFace (Random.int 1 6)
      )

    NewFace newFace ->
      ( Model newFace
      , Cmd.none
      )


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (String.fromInt model.dieFace) ]
    , button [ onClick Roll ] [ text "Roll" ]
    ]
