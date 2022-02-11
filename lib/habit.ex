defmodule Habit do
  @enforce_keys [:name]
  defstruct [:name, :start_date]
  def new(params) do
    params = params
      |> Map.new()
      |> Map.put_new(:start_date, Date.utc_today())

    struct!(__MODULE__, params)
  end
end
