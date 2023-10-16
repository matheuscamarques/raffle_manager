defmodule RaffleManager.Repo do
  use Ecto.Repo,
    otp_app: :raffle_manager,
    adapter: Ecto.Adapters.Postgres
end
