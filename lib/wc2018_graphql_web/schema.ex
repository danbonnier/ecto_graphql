defmodule Wc2018GraphqlWeb.Schema do
  use Absinthe.Schema
  alias Wc2018GraphqlWeb.Resolvers

  @desc "World Cup 2018"

  query do
    @desc "Team info. Takes optional team name."
    field :teams, list_of(:team) do
      arg :name, :string
      resolve &Resolvers.Team.team/3
    end

    @desc "Players of given team."
    field :players, list_of(:player) do
      arg :team, :string
      resolve &Resolvers.Team.players/3
    end

    @desc "Type of goal"
    field :goal_methods, list_of(:method) do
      resolve &Resolvers.Goal.methods/3
    end

    @desc "Top goal makers"
    field :top_ten_scorers, list_of(:top_scorers) do
      resolve &Resolvers.Goal.top_scorers/3
    end

    @desc "Matches"
    field :matches, list_of(:match) do
      resolve &Resolvers.Match.matches/3
    end
  end

  @desc "Match information"
  object :match do
    field :home, :string
    field :away, :string
    field :stadium,   :string
    field :result,    :string, description: "h-a"
  end

  @desc "Team information"
  object :team do
    field :fifa_code, :string, description: "Three-letter country code"
    field :name,      :string, description: "Country name"
    field :group,     :string, description: "Part of this group at start"
  end

  @desc "The players of given team"
  object :player do
    field :name, :string, description: "Player name"
  end

  @desc "How the goals were made"
  object :method do
    field :method, :string, description: "Method of goal"
    field :count,  :integer, description: "Total goals by method in tournament"
  end

  @desc "How scored most goals"
  object :top_scorers do
    field :player, :string, description: "Name of player"
    field :count,  :integer, description: "Total goals in tournament"
  end
end
