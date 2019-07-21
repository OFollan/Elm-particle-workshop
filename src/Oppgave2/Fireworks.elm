module Main exposing (main)

import Helpers exposing (hslString, fireworkView, fizzler, Firework(..), Color(..))
import Browser exposing (Document)
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




update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ParticleMsg inner ->
            ( System.update inner model, Cmd.none )

        Detonate ->
            ( System.burst
             ( Random.list 50 (
            Particle.init (Random.constant (Fizzler Red))
                |> Particle.withDirection ( Random.constant 0)
                |> Particle.withLocation (Random.constant { x = 300, y = 300 })
                |>  Particle.withLifetime (Random.constant 1)
                |> Particle.withSpeed ( Random.constant 200)))  model
            , Cmd.none
            )


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
