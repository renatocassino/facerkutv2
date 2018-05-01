defmodule Facerkutv2.UserView do
  use Facerkutv2.Web, :view
  
  def render("login.json", %{token: my_token}) do
    %{token: my_token}
  end
end
