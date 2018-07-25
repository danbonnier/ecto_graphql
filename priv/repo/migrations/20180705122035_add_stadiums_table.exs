defmodule Wc2018Graphql.Repo.Migrations.AddStadiumsTable do
  use Ecto.Migration

  def change do
    create table("stadiums", comment: "Where the matches were played.") do
      add :name,     :string
      add :capacity, :integer

      add :city_id,  references "cities"
    end
  end
end
