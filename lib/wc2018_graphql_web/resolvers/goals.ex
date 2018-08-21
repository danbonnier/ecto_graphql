defmodule Wc2018GraphqlWeb.Resolvers.Goal do
  import Ecto.Query
  alias Wc2018Graphql.{Repo, Goal}

  def methods(_,_,_) do
    methods = Repo.all from g in Goal,
     join:     m in assoc(g, :method),
     select:   %{method: m.name, count: count(m.id)},
     group_by: m.id,
     order_by: [desc: count(m.id)]

    {:ok, methods}
  end

  def top_scorers(_,_,_) do
    top_scorers = Repo.all from g in Goal,
     join:     p in assoc(g, :player),
     group_by: p.id,
     select:   %{player: p.name, count: count(g.player_id)},
     order_by: [desc: count(g.player_id)],
     limit:    ^10

    {:ok, top_scorers}
  end
end
