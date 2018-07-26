defmodule Wc2018Graphql.Method do
  use Ecto.Schema
  alias Wc2018Graphql.Goal

  schema "methods" do
    field :name, :string

    has_many :goals, Goal
  end
end
