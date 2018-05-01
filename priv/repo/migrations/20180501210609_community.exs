defmodule Facerkutv2.Repo.Migrations.Community do
  use Ecto.Migration

  def change do
    create table(:communities, primary_key: true) do
      add :title, :string, size: 150
      add :description, :text
      add :slug, :string, size: 150
      add :user_id, references(:users)
      timestamps()
    end
  end
end
