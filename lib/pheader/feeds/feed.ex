defmodule Pheader.Feeds.Feed do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pheader.Accounts.User

  schema "feeds" do
    field :name, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(feed, attrs) do
    feed
    |> cast(attrs, [:name, :url, :user_id])
    |> validate_required([:name, :url, :user_id])
  end
end
