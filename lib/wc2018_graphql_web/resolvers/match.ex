defmodule Wc2018GraphqlWeb.Resolvers.Match do
  import Ecto.Query
  alias Wc2018Graphql.{Repo, Match}

  def matches(_,_,_) do
    matches = Repo.all from m in Match,
    join:   s in assoc(m, :stadium),
    join:   h in assoc(m, :home_team),
    join:   a in assoc(m, :away_team),
    select: %{home: h.name, away: a.name, stadium: s.name, result: m.result}

    {:ok, matches}
  end
end
