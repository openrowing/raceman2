defmodule Web.Router do
  use Web.Web, :router

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

  scope "/", Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "/:regatta_id" do
      get "/events", EventController, :index
      scope "/events/:event_id" do
        get "/boats", BoatController, :index
      end
    end
    get "/races/:id", RaceController, :show

    resources "/regattas", RegattaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
