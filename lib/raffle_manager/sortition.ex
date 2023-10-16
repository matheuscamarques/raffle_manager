defmodule RaffleManager.Sortition do
  @moduledoc """
  The Sortition context.
  """

  import Ecto.Query, warn: false
  alias RaffleManager.Repo

  alias RaffleManager.Sortition.Sort

  @doc """
  Returns the list of sort.

  ## Examples

      iex> list_sort()
      [%Sort{}, ...]

  """
  def list_sort do
    Repo.all(Sort)
  end

  @doc """
  Gets a single sort.

  Raises `Ecto.NoResultsError` if the Sort does not exist.

  ## Examples

      iex> get_sort!(123)
      %Sort{}

      iex> get_sort!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sort!(id), do: Repo.get!(Sort, id)

  @doc """
  Creates a sort.

  ## Examples

      iex> create_sort(%{field: value})
      {:ok, %Sort{}}

      iex> create_sort(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sort(attrs \\ %{}) do
    %Sort{}
    |> Sort.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sort.

  ## Examples

      iex> update_sort(sort, %{field: new_value})
      {:ok, %Sort{}}

      iex> update_sort(sort, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sort(%Sort{} = sort, attrs) do
    sort
    |> Sort.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sort.

  ## Examples

      iex> delete_sort(sort)
      {:ok, %Sort{}}

      iex> delete_sort(sort)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sort(%Sort{} = sort) do
    Repo.delete(sort)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sort changes.

  ## Examples

      iex> change_sort(sort)
      %Ecto.Changeset{data: %Sort{}}

  """
  def change_sort(%Sort{} = sort, attrs \\ %{}) do
    Sort.changeset(sort, attrs)
  end

  alias RaffleManager.Sortition.SortNumber

  @doc """
  Returns the list of sort_number.

  ## Examples

      iex> list_sort_number()
      [%SortNumber{}, ...]

  """
  def list_sort_number do
    Repo.all(SortNumber)
  end

  @doc """
  Gets a single sort_number.

  Raises `Ecto.NoResultsError` if the Sort number does not exist.

  ## Examples

      iex> get_sort_number!(123)
      %SortNumber{}

      iex> get_sort_number!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sort_number!(id), do: Repo.get!(SortNumber, id)

  @doc """
  Creates a sort_number.

  ## Examples

      iex> create_sort_number(%{field: value})
      {:ok, %SortNumber{}}

      iex> create_sort_number(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sort_number(attrs \\ %{}) do
    %SortNumber{}
    |> SortNumber.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sort_number.

  ## Examples

      iex> update_sort_number(sort_number, %{field: new_value})
      {:ok, %SortNumber{}}

      iex> update_sort_number(sort_number, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sort_number(%SortNumber{} = sort_number, attrs) do
    sort_number
    |> SortNumber.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sort_number.

  ## Examples

      iex> delete_sort_number(sort_number)
      {:ok, %SortNumber{}}

      iex> delete_sort_number(sort_number)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sort_number(%SortNumber{} = sort_number) do
    Repo.delete(sort_number)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sort_number changes.

  ## Examples

      iex> change_sort_number(sort_number)
      %Ecto.Changeset{data: %SortNumber{}}

  """
  def change_sort_number(%SortNumber{} = sort_number, attrs \\ %{}) do
    SortNumber.changeset(sort_number, attrs)
  end
end
