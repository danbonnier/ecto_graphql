defmodule Wc2018Graphql.Player do
  use Ecto.Schema
  alias Wc2018Graphql.Team

  schema "players" do
    field      :name,   :string

    belongs_to :team,  Team
  end
end
