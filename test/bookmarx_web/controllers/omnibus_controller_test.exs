defmodule BookmarxWeb.OmnibusControllerTest do
  use BookmarxWeb.ConnCase

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Omnibus

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  def fixture(:omnibus) do
    {:ok, omnibus} = Curation.create_omnibus(@create_attrs)
    omnibus
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all omnibi", %{conn: conn} do
      conn = get conn, omnibus_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create omnibus" do
    test "renders omnibus when data is valid", %{conn: conn} do
      conn = post conn, omnibus_path(conn, :create), omnibus: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, omnibus_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, omnibus_path(conn, :create), omnibus: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update omnibus" do
    setup [:create_omnibus]

    test "renders omnibus when data is valid", %{conn: conn, omnibus: %Omnibus{id: id} = omnibus} do
      conn = put conn, omnibus_path(conn, :update, omnibus), omnibus: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, omnibus_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, omnibus: omnibus} do
      conn = put conn, omnibus_path(conn, :update, omnibus), omnibus: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete omnibus" do
    setup [:create_omnibus]

    test "deletes chosen omnibus", %{conn: conn, omnibus: omnibus} do
      conn = delete conn, omnibus_path(conn, :delete, omnibus)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, omnibus_path(conn, :show, omnibus)
      end
    end
  end

  defp create_omnibus(_) do
    omnibus = fixture(:omnibus)
    {:ok, omnibus: omnibus}
  end
end
