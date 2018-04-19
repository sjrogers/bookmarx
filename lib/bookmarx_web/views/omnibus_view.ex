defmodule BookmarxWeb.OmnibusView do
  use BookmarxWeb, :view
  alias BookmarxWeb.OmnibusView

  def render("index.json", %{omnibi: omnibi}) do
    %{data: render_many(omnibi, OmnibusView, "omnibus.json")}
  end

  def render("show.json", %{omnibus: omnibus}) do
    %{data: render_one(omnibus, OmnibusView, "omnibus.json")}
  end

  def render("omnibus.json", %{omnibus: omnibus}) do
    %{id: omnibus.id,
      title: omnibus.title}
  end
end
