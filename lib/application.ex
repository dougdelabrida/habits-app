defmodule Habits.Application do
  use Application

  def start(_type, _opts) do
      children = [
        Habit.Store
      ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
