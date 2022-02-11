defmodule Habits do
  # def create(params) do
  #   Habit.new(params)
  # end
  defdelegate create(params), to: Habit, as: :new
  def success(%Habit{} = habit) do
    # TODO: mark as success and persist in the database
    {:ok, habit}
  end
end
