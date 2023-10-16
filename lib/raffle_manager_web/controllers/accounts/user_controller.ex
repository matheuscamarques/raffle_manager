defmodule RaffleManagerWeb.Controllers.Accounts.UserController do
  use RaffleManagerWeb, :controller
  alias RaffleManagerWeb.Auth.Guardian
  alias RaffleManager.Accounts.User
  alias RaffleManager.Accounts

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> json(%{
        token: token
      })
    end
  end
end
