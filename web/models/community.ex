defmodule Facerkutv2.Community do
  use Facerkutv2.Web, :model

  @primary_key {:id, :id, autogenerate: true}

  schema "communities" do
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, Facerkutv2.User
    has_many :topics, Facerkutv2.Topic

    many_to_many :members, Facerkutv2.User, join_through: "communities_users"

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :slug])
    |> validate_required([:title])
  end
end
