defmodule PheaderWeb.FeedView do
  use PheaderWeb, :view
  alias PheaderWeb.FeedView

  def render("index.json", %{feeds: feeds}) do
    %{data: render_many(feeds, FeedView, "feed.json")}
  end

  def render("show.json", %{feed: feed}) do
    %{data: render_one(feed, FeedView, "feed.json")}
  end

  def render("feed.json", %{feed: feed}) do
    %{id: feed.id,
      name: feed.name,
      url: feed.url,
      user_id: feed.user_id}
  end
end
