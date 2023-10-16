defmodule RaffleManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RaffleManagerWeb.Telemetry,
      # Start the Ecto repository
      RaffleManager.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: RaffleManager.PubSub},
      # Start Finch
      {Finch, name: RaffleManager.Finch},
      # Start the Endpoint (http/https)
      RaffleManagerWeb.Endpoint
      # Start a worker by calling: RaffleManager.Worker.start_link(arg)
      # {RaffleManager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RaffleManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RaffleManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
