defmodule PheaderWeb.PageController do
  use PheaderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "hello.json", current_user: user)
  end
end
