defmodule RaffleManager.Sortition.Sage.SortSage do
  alias RaffleManager.Repo
  alias RaffleManager.Sortition.Sort
  alias RaffleManager.Sortition.SortNumber

  def create(data) do
    Sage.new()
    |> Sage.run(:sort, &create_sort_sage/2)
    |> Sage.run(:sort_numbers, &create_sort_numbers_sage/2)
    |> Sage.transaction(Repo, %{sort: data})
  end

  defp create_sort_sage(_effects, %{sort: sort}) do
    %Sort{}
    |> Sort.changeset(sort)
    |> Repo.insert()
  end

  defp create_sort_numbers_sage(%{sort: %{id: sort_id, range_numbers: range_numbers}}, _) do
    numbers = Enum.to_list(1..range_numbers)

    results =
      numbers
      |> Enum.map(fn number ->
        %SortNumber{}
        |> SortNumber.changeset(%{
          number: number,
          user_id: nil,
          sort_id: sort_id
        })
        |> Repo.insert!()
      end)

    {:ok, results}
  end
end
