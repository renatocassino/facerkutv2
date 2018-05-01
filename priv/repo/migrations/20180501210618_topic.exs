defmodule Facerkutv2.Repo.Migrations.Topic do
  use Ecto.Migration

  def change do
    create table(:topics, primary_key: true) do
      add :title, :string, size: 150
      add :description, :text
      add :slug, :string, size: 150
      add :community_id, references(:communities)
      add :user_id, references(:users)
      timestamps()
    end
  end
end
