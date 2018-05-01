# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :facerkutv2,
  ecto_repos: [Facerkutv2.Repo]

# Configures the endpoint
config :facerkutv2, Facerkutv2.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5PxmzePAY6aQmaIf7KAXrcoygXm0b9q462VdmCR2UpKz/g4BIyUydZbZAFkaUQcF",
  render_errors: [view: Facerkutv2.ErrorView, accepts: ~w(json)],
  pubsub: [name: Facerkutv2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
