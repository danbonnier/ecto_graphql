defmodule Wc2018Graphql.Repo.Migrations.AddGoalsTable do
  use Ecto.Migration

  def change do
    create table("goals", comment: "Scored goals.") do
      add :match_minute, :integer
      add :match_id,   references "matches"
      add :method_id,  references "methods"
      add :player_id,  references "players"
    end
  end
end

