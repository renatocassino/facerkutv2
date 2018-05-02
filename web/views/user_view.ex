defmodule Facerkutv2.UserView do
  use Facerkutv2.Web, :view
  
  def render("login.txt", %{token: my_token}) do
    my_token
  end
end
