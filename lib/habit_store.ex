defmodule Habit.Store do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def create_habit(%Habit{} = habit) do
    GenServer.call(__MODULE__, {:add_habit, habit})
  end

  def delete_habit(name) do
    GenServer.call(__MODULE__, {:delete_habit, name})
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

  def handle_call({:delete_habit, name}, _from, state_server) do
    state = %{
      state_server |
      habits: Enum.filter(state_server.habits, fn x -> x.name != name end)
    }
    {:reply, name, state}
  end
end
