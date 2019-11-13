defmodule PheaderWeb.FeedControllerTest do
  use PheaderWeb.ConnCase

  alias Pheader.Feeds
  alias Pheader.Feeds.Feed

  @create_attrs %{
    name: "some name",
    url: "some url",
    user_id: 42
  }
  @update_attrs %{
    name: "some updated name",
    url: "some updated url",
    user_id: 43
  }
  @invalid_attrs %{name: nil, url: nil, user_id: nil}

  def fixture(:feed) do
    {:ok, feed} = Feeds.create_feed(@create_attrs)
    feed
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all feeds", %{conn: conn} do
      conn = get(conn, Routes.feed_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create feed" do
    test "renders feed when data is valid", %{conn: conn} do
      conn = post(conn, Routes.feed_path(conn, :create), feed: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.feed_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "url" => "some url",
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.feed_path(conn, :create), feed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update feed" do
    setup [:create_feed]

    test "renders feed when data is valid", %{conn: conn, feed: %Feed{id: id} = feed} do
      conn = put(conn, Routes.feed_path(conn, :update, feed), feed: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.feed_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "url" => "some updated url",
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, feed: feed} do
      conn = put(conn, Routes.feed_path(conn, :update, feed), feed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete feed" do
    setup [:create_feed]

    test "deletes chosen feed", %{conn: conn, feed: feed} do
      conn = delete(conn, Routes.feed_path(conn, :delete, feed))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.feed_path(conn, :show, feed))
      end
    end
  end

  defp create_feed(_) do
    feed = fixture(:feed)
    {:ok, feed: feed}
  end
end
