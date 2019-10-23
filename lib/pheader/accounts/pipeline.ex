defmodule Pheader.Accounts.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :pheader,
    error_handler: Pheader.Accounts.ErrorHandler,
    module: Pheader.Accounts.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
