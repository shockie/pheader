defmodule Pheader.Accounts.Guardian do
  use Guardian, otp_app: :pheader

  alias Pheader.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_user(id) do
      nil -> {:error, :ressource_not_found}
      user -> {:ok, user}
    end
  end
end
