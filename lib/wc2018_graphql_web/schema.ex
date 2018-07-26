defmodule Wc2018GraphqlWeb.Schema do
  use Absinthe.Schema
  alias Wc2018GraphqlWeb.Resolvers

  # the entry point for this schema
  # Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "RootQueryType")
  # list_of is handy, meaning this field returns a list of given type.

  @desc "World Cup 2018"
  query do
    @desc "Contending teams"
    field :teams, list_of(:team) do
      arg :name, :string
      resolve &Resolvers.Team.team/3
    end
  end

  # A new object type (several fields)
  # Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "Team")

  @desc "Team representation"
  object :team do
    field :fifa_code, :string, description: "Three-letter country code"
    field :name,      :string, description: "Country name"
    field :group,     :string, description: "Part of this group at start"
  end
end
