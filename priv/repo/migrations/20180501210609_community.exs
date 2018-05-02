defmodule Facerkutv2.Repo.Migrations.Community do
  use Ecto.Migration

  def change do
    create table(:communities, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string, size: 150
      add :description, :text
      add :slug, :string, size: 150
      add :user_id, references(:users, type: :uuid)
      timestamps()
    end
  end
end
