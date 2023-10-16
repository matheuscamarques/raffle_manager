defmodule RaffleManager.Sortition.SortNumber do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "sort_number" do
    field :number, :integer
    field :sort_id, Ecto.UUID
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(sort_number, attrs) do
    sort_number
    |> cast(attrs, [:number, :user_id, :sort_id])
    |> validate_required([:number, :sort_id])
  end
end
