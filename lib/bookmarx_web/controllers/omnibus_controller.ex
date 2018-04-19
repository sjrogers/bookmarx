defmodule BookmarxWeb.OmnibusController do
  use BookmarxWeb, :controller

  alias Bookmarx.Curation
  alias Bookmarx.Curation.Omnibus

  action_fallback BookmarxWeb.FallbackController

  def index(conn, _params) do
    omnibi = Curation.list_omnibi()
    render(conn, "index.json", omnibi: omnibi)
  end

  def create(conn, %{"omnibus" => omnibus_params}) do
    with {:ok, %Omnibus{} = omnibus} <- Curation.create_omnibus(omnibus_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", omnibus_path(conn, :show, omnibus))
      |> render("show.json", omnibus: omnibus)
    end
  end

  def show(conn, %{"id" => id}) do
    omnibus = Curation.get_omnibus!(id)
    render(conn, "show.json", omnibus: omnibus)
  end

  def update(conn, %{"id" => id, "omnibus" => omnibus_params}) do
    omnibus = Curation.get_omnibus!(id)

    with {:ok, %Omnibus{} = omnibus} <- Curation.update_omnibus(omnibus, omnibus_params) do
      render(conn, "show.json", omnibus: omnibus)
    end
  end

  def delete(conn, %{"id" => id}) do
    omnibus = Curation.get_omnibus!(id)
    with {:ok, %Omnibus{}} <- Curation.delete_omnibus(omnibus) do
      send_resp(conn, :no_content, "")
    end
  end
end
