defmodule Facerkutv2.TopicView do
  use Facerkutv2.Web, :view

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, Facerkutv2.TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    render_one(topic, Facerkutv2.TopicView, "topic.json")
  end

  def render("topic.json", %{topic: topic}) do
    %{
      id: topic.id,
      title: topic.title,
      description: topic.description,
      slug: topic.slug,
      inserted_at: topic.inserted_at,
      updated_at: topic.updated_at,
      user: %{
        id: topic.user.id,
        name: topic.user.name,
        photo_url: topic.user.photo_url
      }
    }
  end
end
