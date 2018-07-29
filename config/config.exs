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
  secret_key_base: "5PxmzePAY6aQmaIf7KAXrcoygXm0b9q462VdmCR2UpKz/g4BIyUydZbZAFkaUQcF",
  render_errors: [view: Facerkutv2.ErrorView, accepts: ~w(json)],
  pubsub: [name: Facerkutv2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :oauth2,
  serializers: %{
    "application/vnd.api+json" => Poison
  }

config :guardian, Guardian,
  allowed_algos: ["HS556"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Facerkutv2",
  verify_issuer: false, # optional
  secret_key: "790d45eaf7de01afc1d6d8458051ffb832ddc28921d49b4e9e954837db5bd8b196fc26580323644e5a2381be5471a5fbc5572c8f18194e457c5f8b2c92c039d3",
  serializer: Facerkutv2.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
