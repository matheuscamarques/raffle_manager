defmodule RaffleManager.Repo.Migrations.AddCreateByToSort do
  use Ecto.Migration

  def change do
    alter table(:sort) do
      add :created_by, :binary_id
    end
  end
end
