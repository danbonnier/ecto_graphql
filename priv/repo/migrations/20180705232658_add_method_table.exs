defmodule Wc2018Graphql.Repo.Migrations.AddMethodTable do
  use Ecto.Migration

  def change do
    create table("methods", comment: "How the goals were made.") do
      add :name, :string
    end
  end
end
