defmodule CartClient do
  import  Narp

  defg add_item(item) do
    server -> GenServer.call(server, {:add_item, item})
  end

  defg add_item(cart_id, item) do
    server -> GenServer.call(server, {:add_item, cart_id, item})
  end

  defg show(cart_id) do
    server -> GenServer.call(server, {:show, cart_id})
  end

  defg remove_items(cart_id, items) do
    server -> GenServer.call(server, {:remove_items, cart_id, items})
  end

  defg remove_cart(cart_id) do
    server -> GenServer.call(server, {:remove_cart, cart_id})
  end

  defg update_item(item_id, infos) do
    server -> GenServer.call(server, {:update_item, item_id, infos})
  end
end

defmodule CartClientPolicy do
  def default_policy(_, _\\nil) do
    app_name = Mix.Project.config[:app]
    {Cart.Server, Application.get_env(app_name, :cart_node)}
  end
end