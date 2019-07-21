module Helpers exposing (..)

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


type Firework
    = Fizzler Color

type Color
    = Red
    | Green
    | Blue

fizzler : Color -> Generator (Particle Firework)
fizzler color =
    Particle.init (Random.constant (Fizzler color))
        |> Particle.withDirection (Random.map degrees (Random.float 0 360))
        |> Particle.withSpeed (Random.map (clamp 0 200) (normal 100 100))
        |> Particle.withLifetime (normal 1.25 0.1)


hslString : Float -> Float -> Float -> String
hslString hue saturation luminance =
    "hsl("
        ++ String.fromFloat hue
        ++ ","
        ++ String.fromFloat saturation
        ++ "%,"
        ++ String.fromFloat luminance
        ++ "%)"


toHsl : Color -> ( Float, Float, Float )
toHsl color =
    case color of
        Red ->
            ( 0, 86, 75 )
        Green ->
            (90, 75, 75)
        Blue ->
            (211, 49, 83)



fireworkView : Particle Firework -> Svg msg
fireworkView particle =
    case Particle.data particle of
        Fizzler color ->
            let
                length =
                    max 2 (Particle.speed particle / 15)

                ( hue, saturation, luminance ) =
                    toHsl color

                maxLuminance =
                    100

                luminanceDelta =
                    maxLuminance - luminance

                lifetime =
                    Particle.lifetimePercent particle

                opacity =
                    if lifetime < 0.1 then
                        lifetime * 10

                    else
                        1
            in
            Svg.ellipse
                [ -- location within the burst
                  SAttrs.cx (String.fromFloat (length / 2))
                , SAttrs.cy "0"

                -- size, smeared by motion
                , SAttrs.rx (String.fromFloat length)
                , SAttrs.ry "2"
                , SAttrs.transform ("rotate(" ++ String.fromFloat (Particle.directionDegrees particle) ++ ")")

                -- color!
                , SAttrs.opacity (String.fromFloat opacity)
                , SAttrs.fill
                    (hslString
                        hue
                        saturation
                        (maxLuminance - luminanceDelta * (1 - lifetime))
                    )
                ]
                []

