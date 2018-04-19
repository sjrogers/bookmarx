defmodule Bookmarx.Curation do
  @moduledoc """
  The Curation context.
  """

  import Ecto.Query, warn: false
  alias Bookmarx.Repo

  alias Bookmarx.Curation.Thing

  @doc """
  Returns the list of things.

  ## Examples

      iex> list_things()
      [%Thing{}, ...]

  """
  def list_things do
    Repo.all(Thing)
  end

  @doc """
  Gets a single thing.

  Raises `Ecto.NoResultsError` if the Thing does not exist.

  ## Examples

      iex> get_thing!(123)
      %Thing{}

      iex> get_thing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thing!(id), do: Repo.get!(Thing, id)

  @doc """
  Creates a thing.

  ## Examples

      iex> create_thing(%{field: value})
      {:ok, %Thing{}}

      iex> create_thing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thing(attrs \\ %{}) do
    %Thing{}
    |> Thing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a thing.

  ## Examples

      iex> update_thing(thing, %{field: new_value})
      {:ok, %Thing{}}

      iex> update_thing(thing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thing(%Thing{} = thing, attrs) do
    thing
    |> Thing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Thing.

  ## Examples

      iex> delete_thing(thing)
      {:ok, %Thing{}}

      iex> delete_thing(thing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thing(%Thing{} = thing) do
    Repo.delete(thing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thing changes.

  ## Examples

      iex> change_thing(thing)
      %Ecto.Changeset{source: %Thing{}}

  """
  def change_thing(%Thing{} = thing) do
    Thing.changeset(thing, %{})
  end

  alias Bookmarx.Curation.Omnibus

  @doc """
  Returns the list of omnibi.

  ## Examples

      iex> list_omnibi()
      [%Omnibus{}, ...]

  """
  def list_omnibi do
    Repo.all(Omnibus)
  end

  @doc """
  Gets a single omnibus.

  Raises `Ecto.NoResultsError` if the Omnibus does not exist.

  ## Examples

      iex> get_omnibus!(123)
      %Omnibus{}

      iex> get_omnibus!(456)
      ** (Ecto.NoResultsError)

  """
  def get_omnibus!(id), do: Repo.get!(Omnibus, id)

  @doc """
  Creates a omnibus.

  ## Examples

      iex> create_omnibus(%{field: value})
      {:ok, %Omnibus{}}

      iex> create_omnibus(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_omnibus(attrs \\ %{}) do
    %Omnibus{}
    |> Omnibus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a omnibus.

  ## Examples

      iex> update_omnibus(omnibus, %{field: new_value})
      {:ok, %Omnibus{}}

      iex> update_omnibus(omnibus, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_omnibus(%Omnibus{} = omnibus, attrs) do
    omnibus
    |> Omnibus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Omnibus.

  ## Examples

      iex> delete_omnibus(omnibus)
      {:ok, %Omnibus{}}

      iex> delete_omnibus(omnibus)
      {:error, %Ecto.Changeset{}}

  """
  def delete_omnibus(%Omnibus{} = omnibus) do
    Repo.delete(omnibus)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking omnibus changes.

  ## Examples

      iex> change_omnibus(omnibus)
      %Ecto.Changeset{source: %Omnibus{}}

  """
  def change_omnibus(%Omnibus{} = omnibus) do
    Omnibus.changeset(omnibus, %{})
  end

  alias Bookmarx.Curation.Exhibit

  @doc """
  Returns the list of exhibits.

  ## Examples

      iex> list_exhibits()
      [%Exhibit{}, ...]

  """
  def list_exhibits do
    Repo.all(Exhibit)
  end

  @doc """
  Gets a single exhibit.

  Raises `Ecto.NoResultsError` if the Exhibit does not exist.

  ## Examples

      iex> get_exhibit!(123)
      %Exhibit{}

      iex> get_exhibit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exhibit!(id), do: Repo.get!(Exhibit, id)

  @doc """
  Creates a exhibit.

  ## Examples

      iex> create_exhibit(%{field: value})
      {:ok, %Exhibit{}}

      iex> create_exhibit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exhibit(attrs \\ %{}) do
    %Exhibit{}
    |> Exhibit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exhibit.

  ## Examples

      iex> update_exhibit(exhibit, %{field: new_value})
      {:ok, %Exhibit{}}

      iex> update_exhibit(exhibit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exhibit(%Exhibit{} = exhibit, attrs) do
    exhibit
    |> Exhibit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Exhibit.

  ## Examples

      iex> delete_exhibit(exhibit)
      {:ok, %Exhibit{}}

      iex> delete_exhibit(exhibit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exhibit(%Exhibit{} = exhibit) do
    Repo.delete(exhibit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exhibit changes.

  ## Examples

      iex> change_exhibit(exhibit)
      %Ecto.Changeset{source: %Exhibit{}}

  """
  def change_exhibit(%Exhibit{} = exhibit) do
    Exhibit.changeset(exhibit, %{})
  end
end
