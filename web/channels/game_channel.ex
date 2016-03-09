defmodule Snake.GameChannel do
  use Phoenix.Channel

  alias Snake.Direction
  alias Snake.GameState

  #def broadcast_state(snake) do
  #  broadcast! socket, "updated_snake", snake
  #end

  def join(_channel, _message, socket) do
    {:ok, socket}
  end

  def handle_in("keyboard_event", keyboard_event, socket) do
    keyboard_event
    |> Direction.from_keyboard_event
    |> GameState.direction_changed

    {:noreply, socket}
  end
end
