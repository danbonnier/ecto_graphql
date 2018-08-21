defmodule Wc2018GraphqlWeb.Resolvers.Team do
  import Ecto.Query
  alias Wc2018Graphql.{Repo, Team, Player}

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

  def players(_, %{team: team}, _) when is_binary(team) do
    team = String.capitalize(team)
    players = Repo.all from p in Player,
      join: t in assoc(p, :team),
      where: p.team_id == t.id and t.name == ^team,
      select: %{name: p.name}

    {:ok, players}
  end

  def players(_,_, _),  do: {:error, "No team provided"}
end
