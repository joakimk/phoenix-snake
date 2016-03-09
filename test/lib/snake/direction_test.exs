defmodule Snake.DirectionTest do
  use ExUnit.Case

  test "converts a right input into :right" do
    direction = Snake.Direction.from_keyboard_event(%{ "x" => 1, "y" => 0 })
    assert direction == :right
  end

  test "converts a up input into :up" do
    direction = Snake.Direction.from_keyboard_event(%{ "x" => 0, "y" => 1 })
    assert direction == :up
  end

  test "converts a left input into :left" do
    direction = Snake.Direction.from_keyboard_event(%{ "x" => -1, "y" => 0 })
    assert direction == :up
  end

  test "converts a down input into :down" do
    direction = Snake.Direction.from_keyboard_event(%{ "x" => 0, "y" => -1 })
    assert direction == :down
  end

  test "returns :invalid for several keys at once" do
    direction = Snake.Direction.from_keyboard_event(%{ "x" => -1, "y" => -1 })
    assert direction == :invalid
  end
end
