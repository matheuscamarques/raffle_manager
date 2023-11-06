defmodule RaffleManager.Sortition.Sort do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "sort" do
    field :date_limit, :utc_datetime
    field :description, :string
    field :image, :string
    field :name, :string
    field :range_numbers, :integer
    field :created_by, Ecto.UUID
    timestamps()
  end

  @doc false
  def changeset(sort, attrs) do
    sort
    |> cast(attrs, [:name, :description, :image, :date_limit, :range_numbers])
    |> validate_required([:name, :description, :image, :date_limit, :range_numbers])
  end
end
