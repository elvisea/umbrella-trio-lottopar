defmodule UmbrellaTrioLottoparWeb.Router do
  use UmbrellaTrioLottoparWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {UmbrellaTrioLottoparWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Admin scope
  scope "/admin", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    resources "/operators", OperatorController
    resources "/users", UserController
  end

  # Players scope
  scope "/players", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    resources "/", PlayerController
  end

  # Retail scope
  scope "/retails", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    resources "/", RetailsController
  end

  # Wallet scope
  scope "/wallets", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    resources "/", WalletController
  end

  # Device scope
  scope "/devices", UmbrellaTrioLottoparWeb do
    pipe_through :browser

    resources "/", DeviceController
  end

  # Other scopes may use custom stacks.
  # scope "/api", UmbrellaTrioLottoparWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:umbrella_trio_lottopar_web, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: UmbrellaTrioLottoparWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
