defmodule Wc2018Graphql.Repo.Migrations.AddMatchesTable do
  use Ecto.Migration

  def change do
    create table("matches", comment: "All matches played.") do
      add :result,    :string, size: 5
      add :playtime,  :naive_datetime

      add :home_team_id, references :teams
      add :away_team_id, references :teams
      add :stadium_id,   references :stadiums
    end
  end
end
