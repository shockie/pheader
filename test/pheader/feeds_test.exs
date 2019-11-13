defmodule Pheader.FeedsTest do
  use Pheader.DataCase

  alias Pheader.Feeds

  describe "feeds" do
    alias Pheader.Feeds.Feed

    @valid_attrs %{name: "some name", url: "some url", user_id: 42}
    @update_attrs %{name: "some updated name", url: "some updated url", user_id: 43}
    @invalid_attrs %{name: nil, url: nil, user_id: nil}

    def feed_fixture(attrs \\ %{}) do
      {:ok, feed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Feeds.create_feed()

      feed
    end

    test "list_feeds/0 returns all feeds" do
      feed = feed_fixture()
      assert Feeds.list_feeds() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert Feeds.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      assert {:ok, %Feed{} = feed} = Feeds.create_feed(@valid_attrs)
      assert feed.name == "some name"
      assert feed.url == "some url"
      assert feed.user_id == 42
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feeds.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{} = feed} = Feeds.update_feed(feed, @update_attrs)
      assert feed.name == "some updated name"
      assert feed.url == "some updated url"
      assert feed.user_id == 43
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = Feeds.update_feed(feed, @invalid_attrs)
      assert feed == Feeds.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = Feeds.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> Feeds.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = Feeds.change_feed(feed)
    end
  end
end
