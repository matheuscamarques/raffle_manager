defmodule RaffleManagerWeb.SortController do
  use RaffleManagerWeb, :controller

  alias RaffleManager.Sortition
  alias RaffleManager.Sortition.Sort

  action_fallback RaffleManagerWeb.FallbackController

  def index(conn, _params) do
    sort = Sortition.list_sort()
    render(conn, :index, sort: sort)
  end

  def create(conn, %{"sort" => sort_params}) do
    with {:ok, %Sort{} = sort} <- Sortition.create_sort(sort_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/sort/#{sort.id}")
      |> render(:show, sort: sort)
    end
  end

  def show(conn, %{"id" => id}) do
    sort = Sortition.get_sort!(id)
    render(conn, :show, sort: sort)
  end

  def update(conn, %{"id" => id, "sort" => sort_params}) do
    sort = Sortition.get_sort!(id)

    with {:ok, %Sort{} = sort} <- Sortition.update_sort(sort, sort_params) do
      render(conn, :show, sort: sort)
    end
  end

  def delete(conn, %{"id" => id}) do
    sort = Sortition.get_sort!(id)

    with {:ok, %Sort{}} <- Sortition.delete_sort(sort) do
      send_resp(conn, :no_content, "")
    end
  end
end
