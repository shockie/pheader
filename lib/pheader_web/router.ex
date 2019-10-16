defmodule PheaderWeb.Router do
  use PheaderWeb, :router

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

  # Other scopes may use custom stacks.
  # scope "/api", PheaderWeb do
  #   pipe_through :api
  # end
end
