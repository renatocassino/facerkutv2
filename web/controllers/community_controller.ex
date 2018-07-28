defmodule Facerkutv2.CommunityController do
  use Facerkutv2.Web, :controller

  alias Facerkutv2.{Repo, Community, User}

  def index(conn, _params) do
    communities = Repo.all(Community) |> Repo.preload(:user)
    render(conn, "index.json", communities: communities)
  end

  def show(conn, params) do
    community = Repo.get_by(Community, slug: params["slug"]) |> Repo.preload(:user)
    render(conn, "show.json", community: community)
  end
end
