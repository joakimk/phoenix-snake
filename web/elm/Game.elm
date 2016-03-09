module Game where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard exposing (..)

type alias Snake =
  {
    body : List { x : Int, y : Int }
  }

port updatedSnake : Signal Snake

port keyboard : Signal { x : Int, y : Int }
port keyboard =
  Keyboard.arrows

main : Signal Element
main =
  Signal.map render updatedSnake

render : Snake -> Element
render snake =
  collage 1000 500 (List.map renderElement snake.body)

renderElement : { x : Int, y : Int } -> Form
renderElement element =
  square 20
  |> filled green
  |> moveX (toFloat element.x - 500 + 30)
  |> moveY (toFloat -(element.y - 250 + 30))


green : Color
green =
  rgba 010 111 111 0.6
