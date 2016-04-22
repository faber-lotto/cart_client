defmodule TestServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: Cart.Server)
  end

  def handle_call(msg, _from, _state) do
    {:reply, msg, nil}
  end
end
