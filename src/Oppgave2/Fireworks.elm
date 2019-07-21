module Main exposing (main)

import Helpers exposing (hslString, fireworkView, fizzler, Firework, Color(..))
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



--fireworkAt : Color -> Float -> Float -> Generator (List (Particle Firework))
--fireworkAt color x y =
--    fizzler color
--        |> Particle.withLocation (Random.constant { x = x, y = y })
--        --|> Particle.withGravity 50
--        --|> Particle.withDrag
--        --    (\_ ->
--        --        { coefficient = 1
--        --        , density = 0.015
--        --        , area = 2
--        --        }
--        --    )
--        |> Random.list 150


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
             ( Random.list 50 (fizzler Red)) model

                --(Random.Extra.andThen3 fireworkAt
                --    (Random.constant Red )
                --    (Random.constant 300 )
                --    (Random.constant 300 )
                --)
                --model
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
