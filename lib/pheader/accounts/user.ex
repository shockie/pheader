defmodule Pheader.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pheader.Feeds.Feed

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string

    has_many :feeds, Feed

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_pass_hash()
    |> unique_constraint(:email)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
      %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password, hash_key: :encrypted_password))
  end

  defp put_pass_hash(changeset), do: changeset
end
