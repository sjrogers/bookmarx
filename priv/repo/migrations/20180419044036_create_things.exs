defmodule Bookmarx.Repo.Migrations.CreateThings do
  use Ecto.Migration

  def change do
    create table(:things) do
      add :location, :string

      timestamps()
    end

  end
end
