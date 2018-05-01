defmodule Facerkutv2.TopicController do
  use Facerkutv2.Web, :controller
  
  alias Facerkutv2.{Repo, Community, User, Topic}

  def show(conn, params) do
    topic = Repo.get_by(Topic, slug: params["topic_slug"])
    |> Repo.preload(:community)
    |> Repo.preload(:user)
    render(conn, "show.json", topic: topic)
  end
end
