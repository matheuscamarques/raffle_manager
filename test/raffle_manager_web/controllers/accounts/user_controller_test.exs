defmodule RaffleManagerWeb.Controllers.Accounts.UserControllerTest do
  use RaffleManagerWeb.ConnCase

  @create_attrs %{
    email: "some@email.com.br",
    password: "some_encrypted_password"
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user" do
    test "create user and get token", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @create_attrs)
      assert %{"token" => token} = json_response(conn, 201)
      IO.inspect(token)
      RaffleManagerWeb.Auth.Guardian.decode_and_verify(token) |> IO.inspect()
    end
  end
end
