defmodule Facerkutv2.Auth do
  use OAuth2.Strategy

  def client do
    client = OAuth2.Client.new([
      strategy: OAuth2.Strategy.AuthCode, #default
      client_id: "EFSpoNvYwV0nQgFvOkNIZhPsYf657EmhkyqVkuMHN8JqQI7rVxXJS6a84QH7jEK9",
      client_secret: "xBRohe5azVxILe2FsAhUircNfv0NxkVzH5gTuK5zvEpsZOw9xVLeov2f7yN7sPc2",
      site: "https://disqus.com",
      authorize_url: "https://disqus.com/api/oauth/2.0/authorize",
      redirect_uri: "http://facekut.local:4000/auth/disqus/callback",
      token_url: "https://disqus.com/api/oauth/2.0/access_token"

    ])
  end

  def authorize_url! do
    OAuth2.Client.authorize_url!(client(), scope: "read,write")
  end

  # you can pass options to the underlying http library via `opts` parameter
  def get_token!(params \\ [], headers \\ [], opts \\ []) do
    OAuth2.Client.get_token!(client(), params, headers, opts)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
