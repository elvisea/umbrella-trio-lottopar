import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :backoffice, BackofficeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "hplzryi+RSQH8XANAjrg5vvrPaRR/si4XpsTPYPF8omnCIXqnP45CiQm1xh3T2Nb",
  server: false

# In test we don't send emails
config :backoffice, Backoffice.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, ApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ifqLfn3OIzJMtO5Ujcj3hgO4m6LEXsisUIFdjmKwM7vQVrSuy52ITxXEusQysy6p",
  server: false

# In test we don't send emails
config :api, Api.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auth, AuthWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8lW1Jwbtc0WQYFkUDVgvRTr4DZZXMOUmvCC1a2xgDml3ym1DZp6amGYFjpMSOxZm",
  server: false

# In test we don't send emails
config :auth, Auth.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :repo, Repo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "umbrella_trio_lottopar_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web, Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Cin37zAbwIT9SQTGGc6k+DCbfs+4THRdcnLjzYA1dBl5bnV7Uvit/jhY2efthonw",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails
config :repo, Repo.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
