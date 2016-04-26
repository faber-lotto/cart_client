defmodule CartClientTest do
  use ExUnit.Case, async: false

  setup_all do
    TestServer.start_link
    :ok
  end

  test "calls raise error if :cart_node is not configured" do
    app_name = Mix.Project.config[:app]
    Application.put_env(app_name, :cart_node, nil)
    assert_raise RuntimeError,
      ":cart_node is not configured for your application in :test environment",
      fn -> CartClient.add_item(:item) end
    Application.put_env(app_name, :cart_node, node)
  end

  test "add_item/2 calls server with correct request params" do
    assert {:add_item, :cart_id, :item} = CartClient.add_item(:cart_id, :item)
  end

  test "add_item/1 calls server with correct request params" do
    assert {:add_item, :item} = CartClient.add_item(:item)
  end

  test "show calls server with correct request params" do
    assert {:show, :cart_id} = CartClient.show(:cart_id)
  end

  test "remove_items calls server with correct request params" do
    items = [:item1, :item2]
    assert {:remove_items, :cart_id, [:item1, :item2]} = CartClient.remove_items(:cart_id, items)
  end

  test "remove_cart calls server with correct request params" do
    assert {:remove_cart, :cart_id} = CartClient.remove_cart(:cart_id)
  end

  test "update_item calls server with correct request params" do
    assert {:update_item, :item_id, :new_infos} = CartClient.update_item(:item_id, :new_infos)
  end
end
