defmodule Facerkutv2.Router do
  use Facerkutv2.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Facerkutv2 do
    pipe_through :api
  end

  get "/auth/disqus", Facerkutv2.AuthController, :auth
  get "/auth/disqus/callback", Facerkutv2.AuthController, :callback

  scope "/api/v2", Facerkutv2 do
    get "/login", UserController, :login
    get "/communities", CommunityController, :index
    get "/communities/:slug", CommunityController, :show
    post "/communities/:slug/im-in", CommunityController, :im_in
    get "/communities/:slug/topics/:topic_slug", TopicController, :show
  end
end
