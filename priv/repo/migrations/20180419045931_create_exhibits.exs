defmodule Bookmarx.Repo.Migrations.CreateExhibits do
  use Ecto.Migration

  def change do
    create table(:exhibits) do
      add :comment, :text
      add :omnibus_id, references(:omnibi, on_delete: :nothing)

      timestamps()
    end

    create index(:exhibits, [:omnibus_id])
  end
end
