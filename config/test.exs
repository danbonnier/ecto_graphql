use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wc2018_graphql, Wc2018GraphqlWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :wc2018_graphql, Wc2018Graphql.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "daniel",
  database: "wc2018_graphql_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
