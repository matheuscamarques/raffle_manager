import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :raffle_manager, RaffleManager.Repo,
  username: "postgres",
  password: "159753",
  hostname: "localhost",
  database: "raffle_manager_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :raffle_manager, RaffleManagerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "2qyBSDr0PpkoS3OneoWa9YG7JD4womIk9qT6wvpvFAFESgK6wL/BW3jER0RGcsEB",
  server: false

# In test we don't send emails.
config :raffle_manager, RaffleManager.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
