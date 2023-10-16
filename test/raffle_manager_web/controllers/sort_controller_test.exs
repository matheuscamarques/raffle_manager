defmodule RaffleManagerWeb.SortControllerTest do
  use RaffleManagerWeb.ConnCase

  import RaffleManager.SortitionFixtures

  alias RaffleManager.Sortition.Sort

  @create_attrs %{
    date_limit: ~D[2023-10-15],
    description: "some description",
    image: "some image",
    name: "some name",
    range_numbers: 42
  }
  @update_attrs %{
    date_limit: ~D[2023-10-16],
    description: "some updated description",
    image: "some updated image",
    name: "some updated name",
    range_numbers: 43
  }
  @invalid_attrs %{date_limit: nil, description: nil, image: nil, name: nil, range_numbers: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sort", %{conn: conn} do
      conn = get(conn, ~p"/api/sort")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sort" do
    test "renders sort when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/sort", sort: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/sort/#{id}")

      assert %{
               "id" => ^id,
               "date_limit" => "2023-10-15",
               "description" => "some description",
               "image" => "some image",
               "name" => "some name",
               "range_numbers" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/sort", sort: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sort" do
    setup [:create_sort]

    test "renders sort when data is valid", %{conn: conn, sort: %Sort{id: id} = sort} do
      conn = put(conn, ~p"/api/sort/#{sort}", sort: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/sort/#{id}")

      assert %{
               "id" => ^id,
               "date_limit" => "2023-10-16",
               "description" => "some updated description",
               "image" => "some updated image",
               "name" => "some updated name",
               "range_numbers" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sort: sort} do
      conn = put(conn, ~p"/api/sort/#{sort}", sort: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sort" do
    setup [:create_sort]

    test "deletes chosen sort", %{conn: conn, sort: sort} do
      conn = delete(conn, ~p"/api/sort/#{sort}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/sort/#{sort}")
      end
    end
  end

  defp create_sort(_) do
    sort = sort_fixture()
    %{sort: sort}
  end
end
