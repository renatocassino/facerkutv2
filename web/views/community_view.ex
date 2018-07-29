defmodule Facerkutv2.CommunityView do
  use Facerkutv2.Web, :view
  alias Facerkutv2.{CommunitySerializer}

  def render("index.json", %{communities: communities}) do
    %{data: render_many(communities, Facerkutv2.CommunityView, "community.json")}
  end

  def render("show.json", %{community: community}) do
    render_one(community, Facerkutv2.CommunityView, "community.json")
  end

  def render("im_in.json", %{count: count}) do
    
  end

  def render("community.json", %{community: community}) do
    CommunitySerializer.serializer(:with_user, community)
  end
end
