defmodule Facerkutv2.Repo.Migrations.CreateIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:communities, [:slug])
    create unique_index(:topics, [:slug])
  end
end
