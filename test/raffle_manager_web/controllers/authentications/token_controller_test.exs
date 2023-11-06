defmodule RaffleManagerWeb.Authentications.TokenControllerTest do
  use RaffleManagerWeb.ConnCase
  alias RaffleManagerWeb.Auth.Guardian

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "Sign In Token", %{conn: conn} do
    user = RaffleManager.AccountsFixtures.user_fixture()

    conn =
      post(conn, ~p"/api/token/sign-in", %{
        email: user.email,
        password: "some_encrypted_password"
      })

    # Assuming the response should be a success with a token
    assert json_response(conn, 201)["token"] != nil
  end

  test "Sign Out Token", %{conn: conn} do
    user = RaffleManager.AccountsFixtures.user_fixture()
    {:ok, _user, token} = Guardian.authenticate(user.email, "some_encrypted_password")
    conn = put_req_header(conn, "authorization", "Bearer #{token}")
    conn = get(conn, ~p"/api/token/sign-out")

    assert json_response(conn, 200) == %{"message" => "User signed out successfully"}
  end

  test "Refresh Token", %{conn: conn} do
    user = RaffleManager.AccountsFixtures.user_fixture()
    {:ok, _user, token} = Guardian.authenticate(user.email, "some_encrypted_password")
    conn = put_req_header(conn, "authorization", "Bearer #{token}")
    conn = get(conn, "/api/token/refresh")

    # Assuming the response should be a success with a new token
    assert json_response(conn, 200)["token"] != token
  end
end
