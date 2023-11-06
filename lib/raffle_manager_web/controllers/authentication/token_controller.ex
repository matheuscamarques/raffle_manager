defmodule RaffleManagerWeb.Controllers.Authentication.TokenController do
  use RaffleManagerWeb, :controller
  alias RaffleManagerWeb.Auth.Guardian

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, _user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> json(%{token: token})
    end
  end

  def signout(conn, _) do
    token =
      conn
      |> get_req_header("authorization")
      |> List.first()

    # Remove "Bearer " prefix if it exists
    token = String.replace_prefix(token, "Bearer ", "")
    Guardian.revoke(token)

    conn
    |> put_status(:ok)
    |> json(%{message: "User signed out successfully"})
  end

  def refresh(conn, _) do
    token =
      conn
      |> get_req_header("authorization")
      |> List.first()

    # Remove "Bearer " prefix if it exists
    token = String.replace_prefix(token, "Bearer ", "")
    {:ok, {_old, _}, {new_token,_}} = Guardian.refresh(token)

    conn
    |> put_status(:ok)
    |> json(%{token: new_token})
  end
end
