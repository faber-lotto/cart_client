use Mix.Config

config :cart_client,
  cart_node: node

config :logger, :console,
  level: :warn,
  format: "\n$date $time [$level] $message\n$metadata",
  metadata: [:error]
