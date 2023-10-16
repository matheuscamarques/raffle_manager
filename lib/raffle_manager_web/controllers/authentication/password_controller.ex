defmodule RaffleManagerWeb.Controllers.Authentication.PasswordController do
  use RaffleManagerWeb, :controller

  def request_code(conn, %{
    email: email
  } = params) do
    # Genereta Request Email
  end

  def confirm_code(conn, %{
    code: code
  } = params) do
    # Confirm Request Email Code
  end

  def reset(conn, %{
    code: code,
    password: password,
    confim_password: confim_password
  } = params) do

  end
end
