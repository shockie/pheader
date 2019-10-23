defmodule PheaderWeb.AuthController do
  use PheaderWeb, :controller

  alias Pheader.{Accounts, Accounts.Guardian}

  def sign_in(conn, %{"user" => %{"email" => email, "password" => password }}) do
    Accounts.authenticate_user(email, password)
    |> login_reply(conn)
  end

  defp login_reply({:ok, user}, conn) do
    conn = Guardian.Plug.sign_in(conn, user)
    token = Guardian.Plug.current_token(conn)
    render(conn, "sign_in.json", token: token)
  end

  defp login_reply({:error, reason}, conn) do
    render(conn, "error.json", reason: reason)
  end
end
