module Main exposing (main)

import Browser exposing (Document)
import Helpers exposing (Color(..), Firework(..), fireworkView, hslString)
import Html exposing (Html)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Particle exposing (Particle)
import Particle.System as System exposing (System)
import Random exposing (Generator)
import Random.Extra
import Random.Float exposing (normal)
import Svg exposing (Svg)
import Svg.Attributes as SAttrs


type alias Model =
    System Firework


type Msg
    = ParticleMsg (System.Msg Firework)
    | Detonate


spark : Generator (Particle Firework)
spark =
    Particle.init (Random.constant (Spark Red))
        |> Particle.withSpeed (Random.constant 100)
        |> Particle.withLifetime (Random.constant 1.25)
        |> Particle.withLocation (Random.constant { x = 300, y = 300 })



spawnFireworks : Model -> ( Model, Cmd Msg )
spawnFireworks model =
    (System.burst firework model, Cmd.none )


firework : Generator (List (Particle Firework))
firework =
    spark
        |> Random.list 150


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ParticleMsg inner ->
            ( System.update inner model, Cmd.none )

        Detonate ->
            spawnFireworks model


view : Model -> Html Msg
view model =
    Html.main_ []
        [ Html.button
            [ onClick Detonate
            , style "display" "block"
            ]
            [ Html.text "Detonate!" ]
        , System.view fireworkView
            [ style "width" "600px"
            , style "height" "600px"
            , style "background-color" "#0F0F0F"
            ]
            model
        ]


main : Program () (System Firework) Msg
main =
    Browser.element
        { init = \_ -> ( System.init (Random.initialSeed 0), Cmd.none )
        , update = update
        , view = view
        , subscriptions = \model -> System.sub [] ParticleMsg model
        }
