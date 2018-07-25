defmodule Wc2018Graphql.Repo.Migrations.AddPlayersTable do
  use Ecto.Migration

  def change do
    create table("players", comment: "Players of all teams.") do
      add :name, :string

      add :team_id, references :teams
    end
  end
end
