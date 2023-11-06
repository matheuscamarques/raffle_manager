defmodule RaffleManager.SortitionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RaffleManager.Sortition` context.
  """
  @doc """
  Generate a sort.
  """
  def sort_fixture(attrs \\ %{}) do
    {:ok, sort} =
      attrs
      |> Enum.into(%{
        date_limit: DateTime.utc_now() |> DateTime.truncate(:second),
        description: "some description",
        image: "some image",
        name: "some name",
        range_numbers: 42
      })
      |> RaffleManager.Sortition.create_sort()

    sort
  end

  @doc """
  Generate a sort_number.
  """
  def sort_number_fixture(attrs \\ %{}) do
    {:ok, sort_number} =
      attrs
      |> Enum.into(%{
        number: 42,
        sort_id: "7488a646-e31f-11e4-aace-600308960662",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> RaffleManager.Sortition.create_sort_number()

    sort_number
  end
end
