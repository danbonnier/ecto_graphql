defmodule Wc2018Graphql.Team do
  use Ecto.Schema
  alias Wc2018Graphql.{Group, Player, Match}

  schema "teams" do
    field      :name,       :string
    field      :fifa_code,  :string, size: 3

    belongs_to :group,      Group
    has_many   :players,    Player
    has_many   :matches,    Match
  end
end
