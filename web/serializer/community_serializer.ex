defmodule Facerkutv2.CommunitySerializer do
  alias Facerkutv2.{UserSerializer, Image}

  def serializer(community) do
    %{
      id: community.id,
      title: community.title,
      slug: community.slug,
      description: community.description,
      created_at: community.inserted_at,
      updated_at: community.updated_at,
      images: Image.generate_list([
        [300, 300],
        [500, 500]
      ], community.image_url)
    }
  end

  def serializer(:with_user, community) do
    user = UserSerializer.serializer(:simple_user, community.user)
    serializer(community)
    |> Map.merge(%{
      user: user
    })
  end
end
