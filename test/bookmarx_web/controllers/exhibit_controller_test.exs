defmodule BookmarxWeb.ExhibitControllerTest do
  use BookmarxWeb.ConnCase

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Exhibit

  @create_attrs %{comment: "some comment"}
  @update_attrs %{comment: "some updated comment"}
  @invalid_attrs %{comment: nil}

  def fixture(:exhibit) do
    {:ok, exhibit} = Curation.create_exhibit(@create_attrs)
    exhibit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exhibits", %{conn: conn} do
      conn = get conn, exhibit_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exhibit" do
    test "renders exhibit when data is valid", %{conn: conn} do
      conn = post conn, exhibit_path(conn, :create), exhibit: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, exhibit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "comment" => "some comment"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, exhibit_path(conn, :create), exhibit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exhibit" do
    setup [:create_exhibit]

    test "renders exhibit when data is valid", %{conn: conn, exhibit: %Exhibit{id: id} = exhibit} do
      conn = put conn, exhibit_path(conn, :update, exhibit), exhibit: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, exhibit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "comment" => "some updated comment"}
    end

    test "renders errors when data is invalid", %{conn: conn, exhibit: exhibit} do
      conn = put conn, exhibit_path(conn, :update, exhibit), exhibit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exhibit" do
    setup [:create_exhibit]

    test "deletes chosen exhibit", %{conn: conn, exhibit: exhibit} do
      conn = delete conn, exhibit_path(conn, :delete, exhibit)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, exhibit_path(conn, :show, exhibit)
      end
    end
  end

  defp create_exhibit(_) do
    exhibit = fixture(:exhibit)
    {:ok, exhibit: exhibit}
  end
end
