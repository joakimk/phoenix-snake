module Game where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard exposing (..)

type alias Snake =
  { x : Int, y : Int }

port updatedSnake : Signal Snake

port keyboard : Signal { x : Int, y : Int }
port keyboard =
  Keyboard.arrows

main : Signal Element
main =
  Signal.map render updatedSnake

render snake =
  collage snake.x snake.y
    [ square 20
        |> filled green
    ]


green : Color
green =
  rgba 010 111 111 0.6
