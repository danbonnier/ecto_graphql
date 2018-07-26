defmodule Wc2018Graphql.Goal do
  use Ecto.Schema
  alias Wc2018Graphql.{Method, Player, Match}

  schema "goals" do
    field :match_minute, :integer

    belongs_to :match,  Match
    belongs_to :method, Method
    belongs_to :player, Player
  end
end
