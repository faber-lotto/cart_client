# CartClient

CartClient is a small library of functions that simplify communication with the [Cart](https://github.com/faber-lotto/cart.git) server.

### Usage
Add
```
{:cart_client, git: "https://github.com/faber-lotto/cart_client.git"}
```
to your deps.

Specify your Cart server in the config file of your desired environment:

```
config :my_app,
  cart_node: :"cart@some.node"
```

Now your application can talk to the Cart server using the functions defined in `lib/cart_client.ex`. For example in development you could start an `iex` session:

```
iex --name foo -S mix
```

If the server is running on the node you specified in the config file and you request

```
CartClient.add_item(%{"name" => "foo"})
```

the server sends you a brand new cart with your item in it. Now you have got the id of the cart and can add another item:

```
CartClient.add_item("a7735e4a-b5ac-45a7-9a2c-25521ba44e7e", %{"color" => "blue"})
```

And again you get the current status of the cart, this time with two items inside it.
