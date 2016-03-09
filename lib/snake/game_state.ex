defmodule Snake.GameState do
  use GenServer

  def direction_changed(direction) do
    GenServer.cast(__MODULE__, {:direction, direction})
  end

  def start_link do
    GenServer.start_link(__MODULE__, %{x: 30, y: 30, direction: :right}, name: __MODULE__)
  end

  def init(state) do
    send self, :start_tick
    {:ok, state}
  end

  def handle_info(:start_tick, state) do
    {:ok, _} = :timer.send_interval 250, :tick
    {:noreply, state}
  end

  def handle_info(:tick, state) do
    state = update_by_direction(state)
    state = wrap(state)
    Snake.Endpoint.broadcast! "game", "updated_snake", %{ body: [ %{x: state.x, y: state.y} ] }
    {:noreply, state}
  end

  def handle_cast({:direction, :invalid}, state) do
    {:noreply, state}
  end
  def handle_cast({:direction, direction}, state) do
    IO.inspect "Direction change: #{direction}"
    state = %{state | direction: direction}
    {:noreply, state}
  end

  defp wrap(state = %{ x: 480 }), do: %{ state | x: 30 }
  defp wrap(state = %{ x: 0 }), do: %{ state | x: 480 }
  defp wrap(state = %{ y: 240 }), do: %{ state | y: 30 }
  defp wrap(state = %{ y: 0 }), do: %{ state | y: 240 }
  defp wrap(state), do: state

  defp update_by_direction(state = %{ direction: :right }) do
    %{state | x: state.x + 30}
  end
  defp update_by_direction(state = %{ direction: :left }) do
    %{state | x: state.x - 30}
  end
  defp update_by_direction(state = %{ direction: :up }) do
    %{state | y: state.y - 30}
  end
  defp update_by_direction(state = %{ direction: :down }) do
    %{state | y: state.y + 30}
  end
end
