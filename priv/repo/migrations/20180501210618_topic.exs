defmodule Facerkutv2.Repo.Migrations.Topic do
  use Ecto.Migration

  def change do
    create table(:topics, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string, size: 150
      add :description, :text
      add :slug, :string, size: 150
      add :community_id, references(:communities, type: :uuid)
      add :user_id, references(:users, type: :uuid)
      timestamps()
    end
  end
end
