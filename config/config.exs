# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pheader,
  ecto_repos: [Pheader.Repo]

# Configures the endpoint
config :pheader, PheaderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nAN6e7x3AajhcaKiM/xGWp94YShYjSbYuvww6Sm/Wcyzvaa9Bw87YM1cKV9E/JOR",
  render_errors: [view: PheaderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pheader.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :pheader, Pheader.Accounts.Guardian,
  issuer: "pheader",
  secret_key: "grlriIxHaufnWEzxMLy2U5ISm3AiXgsOkzRbX0JuaGs83CsnLfywXgC4XbQwwxCD"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
