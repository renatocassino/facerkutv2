defmodule Facerkutv2.Repo.Migrations.CommunityMembers do
  use Ecto.Migration

  def change do
    create table(:community_members, primary_key: false) do
      add :community_id, references(:communities)
      add :user_id, references(:users)
    end
  end
end
