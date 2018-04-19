defmodule Bookmarx.Repo.Migrations.CreateOmnibi do
  use Ecto.Migration

  def change do
    create table(:omnibi) do
      add :title, :string

      timestamps()
    end

  end
end
