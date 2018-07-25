defmodule Wc2018Graphql.Repo.Migrations.AddGroupsTable do
  use Ecto.Migration

  def change do
    create table("groups",
      comment: "The groups of four, teams are challenged to advance from."
    ) do
      add :letter, :string, size: 1,
        comment: "Single letter group name."
    end
  end
end
