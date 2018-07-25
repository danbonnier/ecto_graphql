defmodule Wc2018Graphql.Repo.Migrations.AddGroupsTable do
  use Ecto.Migration

  def change do
    create table("groups",
      comment: "Team start the tournament inside groups of four."
    ) do
      add :letter, :string, size: 1,
        comment: "Single letter group name."
    end
  end
end
