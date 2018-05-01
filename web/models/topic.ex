defmodule Facerkutv2.Topic do
  use Facerkutv2.Web, :model

  schema "topics" do
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, Facerkutv2.User
    belongs_to :community, Facerkutv2.Community

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
