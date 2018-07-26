defmodule Wc2018Graphql.Stadium do
  use Ecto.Schema
  alias Wc2018Graphql.{City, Match}

  schema "stadiums" do
    field :name,     :string
    field :capacity, :integer

    belongs_to :city,  City
    has_many :matches, Match
  end
end
