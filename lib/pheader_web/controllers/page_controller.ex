defmodule PheaderWeb.PageController do
  use PheaderWeb, :controller

  def index(conn, _params) do
    user = Pow.Plug.current_user(conn)
    render(conn, "index.html", current_user: user)
  end
end
