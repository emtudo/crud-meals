# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :restaurant,
  ecto_repos: [Restaurant.Repo]

config :restaurant, Restaurant.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :restaurant, RestaurantWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DvbiK57/5SbECkZPk9nP84Ulq6eZlHs+8xmQrGcyDmpuqRtjfegFHKpQCSUDFTSm",
  render_errors: [view: RestaurantWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Restaurant.PubSub,
  live_view: [signing_salt: "QqnRG2HH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
