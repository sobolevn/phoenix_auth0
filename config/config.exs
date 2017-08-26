# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_auth0,
  ecto_repos: [PhoenixAuth0.Repo]

# Configures the endpoint
config :phoenix_auth0, PhoenixAuth0Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: {:system, "SECRET_KEY"},
  render_errors: [view: PhoenixAuth0Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixAuth0.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Social auth
config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: "wemake-services.eu.auth0.com",
  client_id: {:system, "AUTH0_CLIENT_ID"},
  client_secret: {:system, "AUTH0_CLIENT_SECRET"}


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
