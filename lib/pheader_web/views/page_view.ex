defmodule PheaderWeb.PageView do
  use PheaderWeb, :view

  def render("hello.json", %{ current_user: user }) do
    %{
      current_email: user.email
    }
  end
end
