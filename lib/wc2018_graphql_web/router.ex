defmodule Wc2018GraphqlWeb.Router do
  use Wc2018GraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Wc2018GraphqlWeb do
    pipe_through :api
  end
end
