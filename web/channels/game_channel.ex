defmodule Snake.GameChannel do
  use Phoenix.Channel

  def join(_channel, _message, socket) do
    {:ok, socket}
  end

  def handle_in("keyboard_event", data, socket) do
    IO.inspect data
    broadcast! socket, "updated_snake", %{ x: 100, y: 100 }
    {:noreply, socket}
  end
end
