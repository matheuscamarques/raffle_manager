defmodule RaffleManager.Repo.Migrations.CreateSort do
  use Ecto.Migration

  def change do
    create table(:sort, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add :name, :string
      add :description, :string
      add :image, :string
      add :date_limit, :utc_datetime
      add :range_numbers, :integer
      add :unit_value, :float
      timestamps()
    end
  end
end
#sort = %{name: "Sorteio", description: "Sorteio", image: "abc.png", date_limit: "2023-10-16 21:24:53.010111Z", range_numbers: 5}
