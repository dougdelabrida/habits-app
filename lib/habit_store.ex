defmodule Habit.Store do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def create_habit(%Habit{} = habit) do
    GenServer.call(__MODULE__, {:add_habit, habit})
  end

  # GenServer callbacks
  def init(:ok) do
    {:ok, %{habits: [Habit.new(name: "Floss"), Habit.new(name: "Study elixir")]}}
  end

  def handle_call({:add_habit, habit}, _from, state_server) do
    state = %{
      state_server |
      habits: [habit | state_server.habits]
    }
    {:reply, habit, state}
  end
end
