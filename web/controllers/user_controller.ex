defmodule Facerkutv2.UserController do
  use Facerkutv2.Web, :controller

  alias Facerkutv2.{Repo, Community, User, UserSerializer}
  def login(conn, _params) do
    secret = System.get_env("JWT_TOKEN") || "123456789abcdefghijklmnopqrstuvwxyz"
    jwt = Repo.get_by(User, %{email: "renatocassino@gmail.com"})
    |> UserSerializer.serializer()
    |> JsonWebToken.sign(%{key: secret})

    render(conn, "login.txt", token: jwt)
  end
end
