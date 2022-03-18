defmodule Habit.Store do
  def loop do
    receive do
      {:ping, pid} ->
        send(pid, :pong)
      other ->
        IO.inspect("Received unknown message: #{other}")
    end
    loop()
  end

  def ping(store, pid) do
    send(store, {:ping, pid})
  end
end
