defmodule Wc2018Graphql.Group do
  use Ecto.Schema
  alias Wc2018Graphql.Team

  schema "groups" do
    field :letter, :string, size: 1

    has_many :teams, Team
  end
end
