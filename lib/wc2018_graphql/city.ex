defmodule Wc2018Graphql.City do
  use Ecto.Schema
  alias Wc2018Graphql.Stadium

  schema "cities" do
    field :name, :string

    has_many :stadiums, Stadium
  end
end
