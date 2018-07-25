defmodule Wc2018Graphql.Repo.Migrations.AddCitiesTable do
  use Ecto.Migration

  def change do
    create table("cities", comment: "Location of stadiums.") do
      add :name, :string
    end
  end
end
