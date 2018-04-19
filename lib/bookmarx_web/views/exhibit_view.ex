defmodule BookmarxWeb.ExhibitView do
  use BookmarxWeb, :view
  alias BookmarxWeb.ExhibitView

  def render("index.json", %{exhibits: exhibits}) do
    %{data: render_many(exhibits, ExhibitView, "exhibit.json")}
  end

  def render("show.json", %{exhibit: exhibit}) do
    %{data: render_one(exhibit, ExhibitView, "exhibit.json")}
  end

  def render("exhibit.json", %{exhibit: exhibit}) do
    %{id: exhibit.id,
      comment: exhibit.comment}
  end
end
