defmodule Facerkutv2.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: true) do
      add :name, :text
      add :email, :string, size: 150
      add :photo_url, :string
      timestamps()
    end
  end
end
