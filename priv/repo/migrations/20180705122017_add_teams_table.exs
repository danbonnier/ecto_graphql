defmodule Wc2018Graphql.Repo.Migrations.AddTeamsTable do
  use Ecto.Migration

  def change do
    create table("teams", comment: "All contenders.") do
      add :name,      :string
      add :fifa_code, :string, size: 3, comment: "Three letter country code."

      add :group_id,  references "groups"
    end
  end
end
