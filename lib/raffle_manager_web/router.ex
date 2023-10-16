defmodule RaffleManagerWeb.Router do
  use RaffleManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug RaffleManagerWeb.Auth.Pipeline
  end

  scope "/api", RaffleManagerWeb do
    pipe_through :api

    post "/users", Controllers.Accounts.UserController, :create

    scope "/token" do
      post "/sign-in", Controllers.Authentication.TokenController, :signin

      scope("/") do
        pipe_through :auth

        get "/sign-out", Controllers.Authentication.TokenController, :signout
        get "/refresh", Controllers.Authentication.TokenController, :refresh
      end
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:raffle_manager, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: RaffleManagerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
