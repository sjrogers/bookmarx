defmodule Bookmarx.CurationTest do
  use Bookmarx.DataCase

  alias Bookmarx.Curation

  describe "things" do
    alias Bookmarx.Curation.Thing

    @valid_attrs %{location: "some location"}
    @update_attrs %{location: "some updated location"}
    @invalid_attrs %{location: nil}

    def thing_fixture(attrs \\ %{}) do
      {:ok, thing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Curation.create_thing()

      thing
    end

    test "list_things/0 returns all things" do
      thing = thing_fixture()
      assert Curation.list_things() == [thing]
    end

    test "get_thing!/1 returns the thing with given id" do
      thing = thing_fixture()
      assert Curation.get_thing!(thing.id) == thing
    end

    test "create_thing/1 with valid data creates a thing" do
      assert {:ok, %Thing{} = thing} = Curation.create_thing(@valid_attrs)
      assert thing.location == "some location"
    end

    test "create_thing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Curation.create_thing(@invalid_attrs)
    end

    test "update_thing/2 with valid data updates the thing" do
      thing = thing_fixture()
      assert {:ok, thing} = Curation.update_thing(thing, @update_attrs)
      assert %Thing{} = thing
      assert thing.location == "some updated location"
    end

    test "update_thing/2 with invalid data returns error changeset" do
      thing = thing_fixture()
      assert {:error, %Ecto.Changeset{}} = Curation.update_thing(thing, @invalid_attrs)
      assert thing == Curation.get_thing!(thing.id)
    end

    test "delete_thing/1 deletes the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{}} = Curation.delete_thing(thing)
      assert_raise Ecto.NoResultsError, fn -> Curation.get_thing!(thing.id) end
    end

    test "change_thing/1 returns a thing changeset" do
      thing = thing_fixture()
      assert %Ecto.Changeset{} = Curation.change_thing(thing)
    end
  end
end
