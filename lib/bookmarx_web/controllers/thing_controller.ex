defmodule BookmarxWeb.ThingController do
  use BookmarxWeb, :controller

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Thing

  action_fallback BookmarxWeb.FallbackController

  def index(conn, _params) do
    things = Curation.list_things()
    render(conn, "index.json", things: things)
  end

  def create(conn, %{"thing" => thing_params}) do
    with {:ok, %Thing{} = thing} <- Curation.create_thing(thing_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", thing_path(conn, :show, thing))
      |> render("show.json", thing: thing)
    end
  end

  def show(conn, %{"id" => id}) do
    thing = Curation.get_thing!(id)
    render(conn, "show.json", thing: thing)
  end

  def update(conn, %{"id" => id, "thing" => thing_params}) do
    thing = Curation.get_thing!(id)

    with {:ok, %Thing{} = thing} <- Curation.update_thing(thing, thing_params) do
      render(conn, "show.json", thing: thing)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing = Curation.get_thing!(id)
    with {:ok, %Thing{}} <- Curation.delete_thing(thing) do
      send_resp(conn, :no_content, "")
    end
  end
end
