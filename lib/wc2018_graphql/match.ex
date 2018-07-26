defmodule Wc2018Graphql.Match do
  use Ecto.Schema
  alias Wc2018Graphql.{Team, Stadium, Goal}

  schema "matches" do
    field :result, :string, size: 5
    field :playtime, :naive_datetime

    belongs_to :home_team, Team, foreign_key: :home_team_id
    belongs_to :away_team, Team, foreign_key: :away_team_id
    belongs_to :stadium,   Stadium
    has_many   :goals,     Goal
  end
end
