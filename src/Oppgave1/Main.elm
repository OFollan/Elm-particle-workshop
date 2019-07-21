import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
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

init : () -> (Model, Cmd Msg)
init _ =
  ( Model 1
  , Cmd.none
  )


-- UPDATE

type Msg
  = Roll
  -- Denne må utvides!


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      ( model
      , Cmd.none -- Cmd.none gjør akkurat det den beskriver, nemlig ingenting! Her må det utvides.
      )
  -- Her må du legge til noe!




-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ img  [src ("/dice" ++ String.fromInt model.dieFace ++ ".jpg")] []
    , button [ onClick Roll ] [ text "Roll" ]
    ]
