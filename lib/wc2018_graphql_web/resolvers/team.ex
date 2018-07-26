defmodule Wc2018GraphqlWeb.Resolvers.Team do
  import Ecto.Query
  alias Wc2018Graphql.{Repo,Team}

  def team(_, %{name: name}, _) when is_binary(name) do
    teams = Repo.all from t in Team,
      join: g in assoc(t, :group),
      where: ilike(t.name, ^"%#{name}%"),
      select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

    {:ok, teams}
  end

  def team(_,_,_) do
    teams = Repo.all from t in Team,
      join: g in assoc(t, :group),
      select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

    {:ok, teams}
  end
end
