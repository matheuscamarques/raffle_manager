defmodule RaffleManagerWeb.SortJSON do
  alias RaffleManager.Sortition.Sort

  @doc """
  Renders a list of sort.
  """
  def index(%{sort: sort}) do
    %{data: for(sort <- sort, do: data(sort))}
  end

  @doc """
  Renders a single sort.
  """
  def show(%{sort: sort}) do
    %{data: data(sort)}
  end

  defp data(%Sort{} = sort) do
    %{
      id: sort.id,
      name: sort.name,
      description: sort.description,
      image: sort.image,
      date_limit: sort.date_limit,
      range_numbers: sort.range_numbers
    }
  end
end
