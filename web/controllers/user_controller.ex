defmodule Facerkutv2.UserController do
  use Facerkutv2.Web, :controller

  alias Facerkutv2.{Repo, Community, User}
  def login(conn, _params) do
    secret = System.get_env("JWT_TOKEN") || "123456789abcdefghijklmnopqrstuvwxyz"
    jwt = JsonWebToken.sign(%{foo: "bar"}, %{key: secret})

    render(conn, "login.json", token: jwt)
  end
end