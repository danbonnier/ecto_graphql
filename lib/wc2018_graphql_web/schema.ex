defmodule Wc2018GraphqlWeb.Schema do
  use Absinthe.Schema
  alias Wc2018GraphqlWeb.Resolvers

  # the entry point for this schema
  # Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "RootQueryType")
  # list_of is handy, meaning this field returns a list of given type.

  query do
    @desc "Contending teams." 

    field :teams, list_of(:team) do
      arg :name, :string
      resolve &Resolvers.Team.team/3
    end
  end

  # A new object type (several fields)
  # Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "Team")
  
  object :team do
    field :fifa_code, :string
    field :name,      :string
    field :group,     :string
  end
end
