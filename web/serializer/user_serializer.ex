defmodule Facerkutv2.UserSerializer do
  def serializer(user) do
    %{
      id: user.id,
      name: user.name,
      photo_url: user.photo_url,
      email: user.email
    }
  end

  def serializer(:simple_user, user) do
    { _value, data } = serializer(user)
    |> Map.pop(:email)

    data
  end
end
