import Config

# Configure your database
config :umbrella_trio_lottopar, UmbrellaTrioLottopar.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "umbrella_trio_lottopar_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
config :umbrella_trio_lottopar_web, UmbrellaTrioLottoparWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: String.to_integer(System.get_env("PORT") || "4000")],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "4Nx4Am8+EDYZ0TsAlVq8ULD+wD34Fptr6IdIgsvMRH7RWrbWqQgqn3IRHKC4o2ZK",
  watchers: [
    esbuild:
      {Esbuild, :install_and_run, [:umbrella_trio_lottopar_web, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:umbrella_trio_lottopar_web, ~w(--watch)]}
  ]

# Watch static and templates for browser reloading.
config :umbrella_trio_lottopar_web, UmbrellaTrioLottoparWeb.Endpoint,
  live_reload: [
    web_console_logger: true,
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/umbrella_trio_lottopar_web/(?:controllers|live|components|router)/?.*\.(ex|heex)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :umbrella_trio_lottopar_web, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :default_formatter, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Include debug annotations and locations in rendered markup.
  # Changing this configuration will require mix clean and a full recompile.
  debug_heex_annotations: true,
  debug_attributes: true,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
