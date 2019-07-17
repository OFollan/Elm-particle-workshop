import Browser
import Html exposing (Html)
import Html.Attributes as Attrs exposing (style)
import Particle exposing (Particle)
import Particle.System as System exposing (System)
import Random exposing (Generator)
import Random.Float exposing (normal)
import Svg exposing (Svg)
import Svg.Attributes as SAttrs


{-| This `main` is as minimal as possible. The thing to pay attention to is the
call to `System.sub` below, which contains our emitter.
-}

-- emitters


type alias Droplet =
    { color : String
    , radius : Float
    }


droplet : Generator Droplet
droplet =
    Random.map2 Droplet
        (Random.constant "#E3F2FD")
        (normal 20 5)


{-| Emitters take the delta (in milliseconds )since the last update. This is so
you can emit the right number of particles. This emitter emits about 60
particles per second.
-}
waterEmitter : Float -> Generator (List (Particle Droplet))
waterEmitter delta =
    Particle.init droplet
        |> Particle.withLifetime (Random.constant 1)
        |> Particle.withLocation (Random.constant { x = 50, y = 500 })
        |> Particle.withDirection (normal (degrees 45) (degrees 10))
        |> Particle.withSpeed (normal 600 100)
        |> Particle.withGravity 980
        |> Random.list 2



-- views


view : System Droplet -> Html msg
view system =
    Html.main_ []
        [ System.view viewDroplet
            [ style "width" "100%"
            , style "height" "98vh"
            ]
            system
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
