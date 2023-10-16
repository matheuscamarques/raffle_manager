defmodule RaffleManager.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RaffleManager.Accounts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: Faker.Internet.safe_email()

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        password: "some_encrypted_password"
      })
      |> RaffleManager.Accounts.create_user()

    user
  end
end
