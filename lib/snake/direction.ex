defmodule Snake.Direction do
  def from_keyboard_event(%{ "x" => 1, "y" => 0 }),  do: :right
  def from_keyboard_event(%{ "x" => -1, "y" => 0 }), do: :left
  def from_keyboard_event(%{ "x" => 0, "y" => 1 }),  do: :up
  def from_keyboard_event(%{ "x" => 0, "y" => -1 }), do: :down
  def from_keyboard_event(_keyboard_event),          do: :invalid
end
