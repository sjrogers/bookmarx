defmodule Bookmarx.Curation.Thing do
  use Ecto.Schema
  import Ecto.Changeset


  schema "things" do
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(thing, attrs) do
    thing
    |> cast(attrs, [:location])
    |> validate_required([:location])
  end
end
