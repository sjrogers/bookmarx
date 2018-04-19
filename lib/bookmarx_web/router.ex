defmodule BookmarxWeb.Router do
  use BookmarxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookmarxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

   scope "/api", BookmarxWeb do
     pipe_through :api

     resources "/users", UserController, except: [:new, :edit]
     resources "/things", ThingController, except: [:new, :edit]
     resources "/omnibi", OmnibusController,  except: [:new, :edit]
     # TODO: nest exhibits under omnibus
     resources "/exhibits", ExhibitController, except: [:new, :edit]
   end
end
