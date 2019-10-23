defmodule PheaderWeb.AuthView do
  use PheaderWeb, :view

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end

  def render("error.json", %{reason: reason}) do
    %{
      error: reason
    }
  end

end
