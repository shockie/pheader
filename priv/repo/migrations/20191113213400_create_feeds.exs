defmodule Pheader.Repo.Migrations.CreateFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds) do
      add :name, :string
      add :url, :string
      add :user_id, :integer

      timestamps()
    end

  end
end
