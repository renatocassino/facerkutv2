defmodule Facerkutv2.User do
  use Facerkutv2.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :photo_url, :string
    has_one :user, Facerkutv2.Community
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
