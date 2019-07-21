module Main exposing (main)

import Browser
import Html exposing (Html, div)
import Html.Attributes as Attrs exposing (style)
import Html.Events exposing (onClick)
import Particle exposing (Particle)
import Particle.System as System exposing (System)
import Random exposing (Generator)
import Random.Float exposing (normal)
import Svg exposing (Svg)
import Svg.Attributes as SAttrs


{-| This `main` is as minimal as possible. The thing to pay attention to is the
call to `System.sub` below, which contains our emitter.
-}
main : Program () (System Droplet) (System.Msg Droplet)
main =
    Browser.element
        { init = \_ -> ( System.init (Random.initialSeed 0), Cmd.none )
        , view = view
        , update = update
        , subscriptions = \model -> System.sub [] ParticleMsg model
        }



-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        --ParticleMsg  ->
        --    (System.update msg system, Cmd.none)

        _ ->
            (System.update msg model, Cmd.none)



-- emitters

type Msg
    = ParticleMsg (System.Msg Droplet)
    | Detonate

type alias Droplet =
    { color : String
    , radius : Float
    }


droplet : Generator Droplet
droplet =
    Random.map2 Droplet
        (Random.constant "#FF0000")
        (Random.constant 20)


{-| Emitters take the delta (in milliseconds )since the last update. This is so
you can emit the right number of particles. This emitter emits about 60
particles per second.
-}
waterEmitter : Float -> Generator (List (Particle Droplet))
waterEmitter delta =
    Particle.init droplet
        |> Particle.withLifetime (Random.constant 0.5)
        |> Particle.withLocation (Random.constant { x = 500, y = 500 })
        |> Particle.withDirection (normal (degrees 0) (degrees 360))
        |> Particle.withSpeed (normal 600 100)
        --|> Particle.withGravity 980
        |> Random.list 1



-- views
type alias Model = System Droplet

view : Model -> Html msg
view model =
    div []
        [ System.view viewDroplet
            [ style "width" "100%"
            , style "height" "98vh"
            ]
            model ,
            Html.button
            [onClick Detonate,
             style "display" "block"
            ]
            [ Html.text "Detonate!" ]
        ]


viewDroplet : Particle Droplet -> Svg msg
viewDroplet particle =
    let
        { color, radius } =
            Particle.data particle
    in
    Svg.circle
        [ SAttrs.r (String.fromFloat radius)
        , SAttrs.fill color
        ]
        []
