defmodule PheaderWeb.UserView do
  use PheaderWeb, :view

  def render("me.json", %{ current_user: user }) do
    %{
      id: user.id,
      email: user.email
    }
  end
end
