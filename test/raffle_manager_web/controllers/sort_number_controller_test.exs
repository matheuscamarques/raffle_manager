defmodule RaffleManagerWeb.SortNumberControllerTest do
  use RaffleManagerWeb.ConnCase

  import RaffleManager.SortitionFixtures

  alias RaffleManager.Sortition.SortNumber

  @create_attrs %{
    number: 42,
    sort_id: "7488a646-e31f-11e4-aace-600308960662",
    user_id: "7488a646-e31f-11e4-aace-600308960662"
  }
  @update_attrs %{
    number: 43,
    sort_id: "7488a646-e31f-11e4-aace-600308960668",
    user_id: "7488a646-e31f-11e4-aace-600308960668"
  }
  @invalid_attrs %{number: nil, sort_id: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sort_number", %{conn: conn} do
      conn = get(conn, ~p"/api/sort_number")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sort_number" do
    test "renders sort_number when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/sort_number", sort_number: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/sort_number/#{id}")

      assert %{
               "id" => ^id,
               "number" => 42,
               "sort_id" => "7488a646-e31f-11e4-aace-600308960662",
               "user_id" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/sort_number", sort_number: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sort_number" do
    setup [:create_sort_number]

    test "renders sort_number when data is valid", %{conn: conn, sort_number: %SortNumber{id: id} = sort_number} do
      conn = put(conn, ~p"/api/sort_number/#{sort_number}", sort_number: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/sort_number/#{id}")

      assert %{
               "id" => ^id,
               "number" => 43,
               "sort_id" => "7488a646-e31f-11e4-aace-600308960668",
               "user_id" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sort_number: sort_number} do
      conn = put(conn, ~p"/api/sort_number/#{sort_number}", sort_number: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sort_number" do
    setup [:create_sort_number]

    test "deletes chosen sort_number", %{conn: conn, sort_number: sort_number} do
      conn = delete(conn, ~p"/api/sort_number/#{sort_number}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/sort_number/#{sort_number}")
      end
    end
  end

  defp create_sort_number(_) do
    sort_number = sort_number_fixture()
    %{sort_number: sort_number}
  end
end
