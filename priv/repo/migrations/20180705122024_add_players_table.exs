defmodule Wc2018Graphql.Repo.Migrations.AddPlayersTable do
  use Ecto.Migration

  def change do
    create table("players", comment: "Team players.") do
      add :name, :string

      add :team_id, references :teams
    end
  end
end
