defmodule Habits do
  def create(params) do
    params
    |> Habit.new()
    |> Habit.Store.create_habit()
  end
  def success(%Habit{} = habit) do
    # TODO: mark as success and persist in the database
    {:ok, habit}
  end
end
