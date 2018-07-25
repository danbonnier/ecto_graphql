defmodule Wc2018Graphql.Repo.Migrations.AddMethodTable do
  use Ecto.Migration

  def change do
    create table("methods", comment: "Scored goal method.") do
      add :name, :string
    end
  end
end
