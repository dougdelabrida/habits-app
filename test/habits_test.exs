defmodule HabitsTest do
  use ExUnit.Case
  doctest Habits

  test "greets the world" do
    assert Habits.hello() == :world
  end
end
