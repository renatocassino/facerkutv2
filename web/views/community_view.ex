defmodule Facerkutv2.CommunityView do
  use Facerkutv2.Web, :view
  
  def render("index.json", %{communities: communities}) do
    %{data: render_many(communities, Facerkutv2.CommunityView, "community.json")}
  end
  
  def render("show.json", %{community: community}) do
    render_one(community, Facerkutv2.CommunityView, "community.json")
  end
  
  def render("community.json", %{community: community}) do
    %{
      id: community.id,
      title: community.title,
      description: community.description,
      slug: community.slug,
      inserted_at: community.inserted_at,
      updated_at: community.updated_at
    }
  end
end
