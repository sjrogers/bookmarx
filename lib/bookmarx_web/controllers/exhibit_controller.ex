defmodule BookmarxWeb.ExhibitController do
  use BookmarxWeb, :controller

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Exhibit

  action_fallback BookmarxWeb.FallbackController

  def index(conn, _params) do
    exhibits = Curation.list_exhibits()
    render(conn, "index.json", exhibits: exhibits)
  end

  def create(conn, %{"exhibit" => exhibit_params}) do
    with {:ok, %Exhibit{} = exhibit} <- Curation.create_exhibit(exhibit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", exhibit_path(conn, :show, exhibit))
      |> render("show.json", exhibit: exhibit)
    end
  end

  def show(conn, %{"id" => id}) do
    exhibit = Curation.get_exhibit!(id)
    render(conn, "show.json", exhibit: exhibit)
  end

  def update(conn, %{"id" => id, "exhibit" => exhibit_params}) do
    exhibit = Curation.get_exhibit!(id)

    with {:ok, %Exhibit{} = exhibit} <- Curation.update_exhibit(exhibit, exhibit_params) do
      render(conn, "show.json", exhibit: exhibit)
    end
  end

  def delete(conn, %{"id" => id}) do
    exhibit = Curation.get_exhibit!(id)
    with {:ok, %Exhibit{}} <- Curation.delete_exhibit(exhibit) do
      send_resp(conn, :no_content, "")
    end
  end
end
