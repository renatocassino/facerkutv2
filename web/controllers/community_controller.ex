defmodule Facerkutv2.CommunityController do
  use Facerkutv2.Web, :controller

  alias Facerkutv2.{Repo, Community, User}

  def index(conn, _params) do
      query = (from c in Community, join: u in User, where: c.user_id == u.id, select: %{
          id: c.id,
          title: c.title,
          slug: c.slug,
          description: c.description,
          created_at: c.created_at,
          updated_at: c.updated_at,
          user: %{
            id: u.id,
            name: u.name,
            photo_url: u.photo_url,
            email: u.email
          }
    })

    communities = Repo.all(query)
    render(conn, "index.json", communities: communities)
  end

  def show(conn, params) do
    community = Repo.get_by(Community, slug: params["slug"]) |> Repo.preload(:user)
    render(conn, "show.json", community: community)
  end
end
