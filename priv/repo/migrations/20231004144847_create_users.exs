defmodule RaffleManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add :email, :string
      add :encrypted_password, :string

      timestamps()
    end

    # Create an index on the email column
    create index(:users, [:email])
  end
end
