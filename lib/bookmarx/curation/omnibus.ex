defmodule Bookmarx.Curation.Omnibus do
  use Ecto.Schema
  import Ecto.Changeset


  schema "omnibi" do
    field :title, :string
    has_many :exhibits, Bookmarx.Curation.Exhibit

    timestamps()
  end

  @doc false
  def changeset(omnibus, attrs) do
    omnibus
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
