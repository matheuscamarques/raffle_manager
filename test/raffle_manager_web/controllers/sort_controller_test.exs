defmodule RaffleManagerWeb.SortControllerTest do
  use RaffleManagerWeb.ConnCase

  import RaffleManager.SortitionFixtures

  alias RaffleManager.Sortition.Sort
  alias RaffleManagerWeb.Auth.Guardian

  @create_attrs %{
    date_limit: DateTime.utc_now() |> DateTime.truncate(:second) |> to_string,
    description: "some description",
    image: "some image",
    name: "some name",
    range_numbers: 42
  }
  @update_attrs %{
    date_limit: DateTime.utc_now() |> DateTime.truncate(:second) |> to_string,
    description: "some updated description",
    image: "some updated image",
    name: "some updated name",
    range_numbers: 43
  }
  @invalid_attrs %{date_limit: nil, description: nil, image: nil, name: nil, range_numbers: nil}

  setup %{conn: conn} do
    user = RaffleManager.AccountsFixtures.user_fixture()
    {:ok, _user, token} = Guardian.authenticate(user.email, "some_encrypted_password")

    conn =
      conn
      |> put_req_header("authorization", "Bearer #{token}")
      |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
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
               "date_limit" => _,
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
               "date_limit" => _,
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
