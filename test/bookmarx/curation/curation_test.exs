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

  describe "omnibi" do
    alias Bookmarx.Curation.Omnibus

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def omnibus_fixture(attrs \\ %{}) do
      {:ok, omnibus} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Curation.create_omnibus()

      omnibus
    end

    test "list_omnibi/0 returns all omnibi" do
      omnibus = omnibus_fixture()
      assert Curation.list_omnibi() == [omnibus]
    end

    test "get_omnibus!/1 returns the omnibus with given id" do
      omnibus = omnibus_fixture()
      assert Curation.get_omnibus!(omnibus.id) == omnibus
    end

    test "create_omnibus/1 with valid data creates a omnibus" do
      assert {:ok, %Omnibus{} = omnibus} = Curation.create_omnibus(@valid_attrs)
      assert omnibus.title == "some title"
    end

    test "create_omnibus/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Curation.create_omnibus(@invalid_attrs)
    end

    test "update_omnibus/2 with valid data updates the omnibus" do
      omnibus = omnibus_fixture()
      assert {:ok, omnibus} = Curation.update_omnibus(omnibus, @update_attrs)
      assert %Omnibus{} = omnibus
      assert omnibus.title == "some updated title"
    end

    test "update_omnibus/2 with invalid data returns error changeset" do
      omnibus = omnibus_fixture()
      assert {:error, %Ecto.Changeset{}} = Curation.update_omnibus(omnibus, @invalid_attrs)
      assert omnibus == Curation.get_omnibus!(omnibus.id)
    end

    test "delete_omnibus/1 deletes the omnibus" do
      omnibus = omnibus_fixture()
      assert {:ok, %Omnibus{}} = Curation.delete_omnibus(omnibus)
      assert_raise Ecto.NoResultsError, fn -> Curation.get_omnibus!(omnibus.id) end
    end

    test "change_omnibus/1 returns a omnibus changeset" do
      omnibus = omnibus_fixture()
      assert %Ecto.Changeset{} = Curation.change_omnibus(omnibus)
    end
  end

  describe "exhibits" do
    alias Bookmarx.Curation.Exhibit

    @valid_attrs %{comment: "some comment"}
    @update_attrs %{comment: "some updated comment"}
    @invalid_attrs %{comment: nil}

    def exhibit_fixture(attrs \\ %{}) do
      {:ok, exhibit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Curation.create_exhibit()

      exhibit
    end

    test "list_exhibits/0 returns all exhibits" do
      exhibit = exhibit_fixture()
      assert Curation.list_exhibits() == [exhibit]
    end

    test "get_exhibit!/1 returns the exhibit with given id" do
      exhibit = exhibit_fixture()
      assert Curation.get_exhibit!(exhibit.id) == exhibit
    end

    test "create_exhibit/1 with valid data creates a exhibit" do
      assert {:ok, %Exhibit{} = exhibit} = Curation.create_exhibit(@valid_attrs)
      assert exhibit.comment == "some comment"
    end

    test "create_exhibit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Curation.create_exhibit(@invalid_attrs)
    end

    test "update_exhibit/2 with valid data updates the exhibit" do
      exhibit = exhibit_fixture()
      assert {:ok, exhibit} = Curation.update_exhibit(exhibit, @update_attrs)
      assert %Exhibit{} = exhibit
      assert exhibit.comment == "some updated comment"
    end

    test "update_exhibit/2 with invalid data returns error changeset" do
      exhibit = exhibit_fixture()
      assert {:error, %Ecto.Changeset{}} = Curation.update_exhibit(exhibit, @invalid_attrs)
      assert exhibit == Curation.get_exhibit!(exhibit.id)
    end

    test "delete_exhibit/1 deletes the exhibit" do
      exhibit = exhibit_fixture()
      assert {:ok, %Exhibit{}} = Curation.delete_exhibit(exhibit)
      assert_raise Ecto.NoResultsError, fn -> Curation.get_exhibit!(exhibit.id) end
    end

    test "change_exhibit/1 returns a exhibit changeset" do
      exhibit = exhibit_fixture()
      assert %Ecto.Changeset{} = Curation.change_exhibit(exhibit)
    end
  end
end
