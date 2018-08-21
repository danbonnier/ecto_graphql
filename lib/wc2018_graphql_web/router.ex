defmodule Wc2018GraphqlWeb.Router do
  use Wc2018GraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

  forward "/api", Absinthe.Plug,
    schema: Wc2018GraphqlWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Wc2018GraphqlWeb.Schema,
    interface: :advanced
    #interface: :simple
    #interface: :playground
  end
end
