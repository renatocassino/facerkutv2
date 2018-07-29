defmodule Facerkutv2.Router do
  use Facerkutv2.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  get "/auth/disqus", Facerkutv2.AuthController, :auth
  get "/auth/disqus/callback", Facerkutv2.AuthController, :callback

  scope "/api/v2", Facerkutv2 do
    pipe_through :api
    get "/login", UserController, :login
    get "/communities", CommunityController, :index
    get "/communities/:slug", CommunityController, :show
    get "/communities/:slug/topics/:topic_slug", TopicController, :show

    pipe_through :authenticated # Authenticated routes bellow
    post "/communities/:slug/im-in", CommunityController, :im_in
  end
end
