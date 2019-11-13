defmodule PheaderWeb.Router do
  use PheaderWeb, :router

  pipeline :auth do
    plug Pheader.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

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

  scope "/", PheaderWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create],
      singleton: true
  end

  scope "/api", PheaderWeb do
    pipe_through [:api, :auth]

    post "/auth/token", AuthController, :sign_in
  end

  scope "/api", PheaderWeb do
    pipe_through [:api, :auth, :ensure_auth]

    get "/me", UserController, :me

    resources "/feeds", FeedController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PheaderWeb do
  #   pipe_through :api
  # end
end
