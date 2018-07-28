defmodule Facerkutv2.AuthController do
  use Facerkutv2.Web, :controller

  def auth(conn, _params) do
    url = Facerkutv2.Auth.authorize_url!
    redirect conn, external: url
  end

  def callback(conn, params) do
    code = params["code"]
    client = Facerkutv2.Auth.client()
    client = OAuth2.Client.get_token!(client, code: code)

    #user = OAuth2.Client.get!(client, "/api/3.0/users/details.json").body

    text conn, "OK"
  end
end
