defmodule BookmarxWeb.ThingView do
  use BookmarxWeb, :view
  alias BookmarxWeb.ThingView

  def render("index.json", %{things: things}) do
    %{data: render_many(things, ThingView, "thing.json")}
  end

  def render("show.json", %{thing: thing}) do
    %{data: render_one(thing, ThingView, "thing.json")}
  end

  def render("thing.json", %{thing: thing}) do
    %{id: thing.id,
      location: thing.location}
  end
end
