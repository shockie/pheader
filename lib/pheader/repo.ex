defmodule Pheader.Repo do
  use Ecto.Repo,
    otp_app: :pheader,
    adapter: Ecto.Adapters.Postgres
end
