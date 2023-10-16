defmodule RaffleManagerWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :raffle_manager,
    module: RaffleManagerWeb.Auth.Guardian,
    error_handler: RaffleManagerWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
