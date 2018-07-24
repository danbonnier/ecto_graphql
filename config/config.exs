# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wc2018_graphql,
  ecto_repos: [Wc2018Graphql.Repo]

# Configures the endpoint
config :wc2018_graphql, Wc2018GraphqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zupJLiquaFNYja3RfyzpDR80KvqjVtHAaklstQPLOWHwEpcz7jIVow5ln74x/dQj",
  render_errors: [view: Wc2018GraphqlWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Wc2018Graphql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
