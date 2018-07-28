defmodule Facerkutv2.SessionsController do
  use Facerkutv2.Web, :controller

  alias Facerkutv2.{Repo, User}

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{"session" => session_params}) do
    case Facerkutv2.Session.authenticate(session_params) do
    {:ok, user} ->
      {:ok, jwt, _full_claims} = user
        |> Guardian.encode_and_sign(:token)
      conn
        |> put_status(:created)
        |> render("show.json", jwt: jwt, user: user)
    :error ->
      conn
      |> put_status(:unprocessable_entity)
      |> render("error.json")
    end
  end

  def authenticate(conn, params) do

  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(Facerkutv2.SessionsView, "forbidden.json",
      error: "Not Authenticated!")
  end
end
