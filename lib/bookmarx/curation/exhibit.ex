defmodule Bookmarx.Curation.Exhibit do
  use Ecto.Schema
  import Ecto.Changeset


  schema "exhibits" do
    field :comment, :string
    belongs_to :omnibus, Bookmarx.Curation.Omnibus

    timestamps()
  end

  @doc false
  def changeset(exhibit, attrs) do
    exhibit
    |> cast(attrs, [:comment])
    |> validate_required([:comment])
  end
end
