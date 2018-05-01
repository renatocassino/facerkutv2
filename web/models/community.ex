defmodule Facerkutv2.Community do
  use Facerkutv2.Web, :model

  schema "communities" do
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, Facerkutv2.User

    many_to_many :tags, Facerkutv2.User, join_through: "community_members"
    timestamps()
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
