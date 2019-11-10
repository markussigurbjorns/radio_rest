# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :radio_rest,
  ecto_repos: [RadioRest.Repo]

# Configures the endpoint
config :radio_rest, RadioRestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Rn4Ivgepf3yeCEEkO9locI56ujkyYbbjl4QUh4L6KYhhYmgKdfOMFVsRUHec/UzH",
  render_errors: [view: RadioRestWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RadioRest.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
