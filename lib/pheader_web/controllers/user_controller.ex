defmodule PheaderWeb.UserController do
  use PheaderWeb, :controller

  alias Pheader.Accounts
  alias Pheader.Accounts.User

  def me(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "me.json", current_user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
