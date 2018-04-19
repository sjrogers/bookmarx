defmodule BookmarxWeb.ThingControllerTest do
  use BookmarxWeb.ConnCase

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Thing

  @create_attrs %{location: "some location"}
  @update_attrs %{location: "some updated location"}
  @invalid_attrs %{location: nil}

  def fixture(:thing) do
    {:ok, thing} = Curation.create_thing(@create_attrs)
    thing
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all things", %{conn: conn} do
      conn = get conn, thing_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create thing" do
    test "renders thing when data is valid", %{conn: conn} do
      conn = post conn, thing_path(conn, :create), thing: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, thing_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "location" => "some location"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, thing_path(conn, :create), thing: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update thing" do
    setup [:create_thing]

    test "renders thing when data is valid", %{conn: conn, thing: %Thing{id: id} = thing} do
      conn = put conn, thing_path(conn, :update, thing), thing: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, thing_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "location" => "some updated location"}
    end

    test "renders errors when data is invalid", %{conn: conn, thing: thing} do
      conn = put conn, thing_path(conn, :update, thing), thing: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete thing" do
    setup [:create_thing]

    test "deletes chosen thing", %{conn: conn, thing: thing} do
      conn = delete conn, thing_path(conn, :delete, thing)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, thing_path(conn, :show, thing)
      end
    end
  end

  defp create_thing(_) do
    thing = fixture(:thing)
    {:ok, thing: thing}
  end
end
