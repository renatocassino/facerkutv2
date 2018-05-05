defmodule Facerkutv2.Image do
  def generate_list(sizes, image) do
    client = ThumborClient.client()
    server = System.get_env("THUMBOR_URL")

    map = Enum.reduce(sizes, %{}, fn(size, sizes) ->
      [w, h] = size
      uri = client.(%{width: w, height: h, image: image, smart: true})
      Map.put(sizes, "_#{w}x#{h}", "#{server}#{uri}")
    end)

    IO.inspect map
    map
  end
end
