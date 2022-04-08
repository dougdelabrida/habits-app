defmodule Habits.Supervisor do
  use Supervisor

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl Supervisor
  def init(:ok) do
    children = [
      Habit.Store
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
