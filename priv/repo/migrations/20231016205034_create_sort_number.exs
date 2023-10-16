defmodule RaffleManager.Repo.Migrations.CreateSortNumber do
  use Ecto.Migration

  def change do
    create table(:sort_number, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add :number, :integer
      add :user_id, :uuid
      add :sort_id, :uuid

      timestamps()
    end
  end
end
