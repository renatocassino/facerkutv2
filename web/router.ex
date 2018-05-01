defmodule Facerkutv2.Router do
  use Facerkutv2.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Facerkutv2 do
    pipe_through :api
  end

  scope "/api", Facerkutv2 do
    get "/login", UserController, :login
    get "/communities", CommunityController, :index
    get "/communities/:slug", CommunityController, :show
    get "/communities/:slug/topics/:topic_slug", TopicController, :show
  end
end
