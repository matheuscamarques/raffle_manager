defmodule RaffleManagerWeb.SortNumberJSON do
  alias RaffleManager.Sortition.SortNumber

  @doc """
  Renders a list of sort_number.
  """
  def index(%{sort_number: sort_number}) do
    %{data: for(sort_number <- sort_number, do: data(sort_number))}
  end

  @doc """
  Renders a single sort_number.
  """
  def show(%{sort_number: sort_number}) do
    %{data: data(sort_number)}
  end

  defp data(%SortNumber{} = sort_number) do
    %{
      id: sort_number.id,
      number: sort_number.number,
      user_id: sort_number.user_id,
      sort_id: sort_number.sort_id
    }
  end
end
