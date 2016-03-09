defmodule Snake.GameState do
  use GenServer

  def direction_changed(direction) do
    GenServer.cast(__MODULE__, {:direction, direction})
  end

  def start_link do
    GenServer.start_link(__MODULE__, %{x: 30, y: 300, direction: :right}, name: __MODULE__)
  end

  def init(state) do
    send self, :start_tick
    {:ok, state}
  end

  def handle_info(:start_tick, state) do
    {:ok, _} = :timer.send_interval 1000, :tick
    {:noreply, state}
  end

  def handle_info(:tick, state) do
    IO.inspect "TICK"
    state = update_by_direction(state)
    Snake.Endpoint.broadcast! "game", "updated_snake", %{x: state.x, y: state.y}
    IO.inspect state
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
