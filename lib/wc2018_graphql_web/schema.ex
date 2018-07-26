defmodule Wc2018GraphqlWeb.Schema do
  use Absinthe.Schema
  import Ecto.Query
  alias Wc2018Graphql.{Repo,Team}

  # the entry point for this schema
  # Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "RootQueryType")
  # list_of is handy, meaning this field returns a list of given type.

  query do
    @desc "Contending teams." 

    field :teams, list_of(:team) do
      arg :name, :string
        resolve fn
          _, %{name: name}, _ when is_binary(name) ->
            teams = Repo.all from t in Team,
              join: g in assoc(t, :group),
              where: ilike(t.name, ^"%#{name}%"),
              select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

            {:ok, teams}

          _,_,_ ->
            teams = Repo.all from t in Team,
              join: g in assoc(t, :group),
              select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

            {:ok, teams}
      end
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
