defmodule UmbrellaTrioLottopar.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UmbrellaTrioLottopar.Repo,
      {DNSCluster,
       query: Application.get_env(:umbrella_trio_lottopar, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UmbrellaTrioLottopar.PubSub}
      # Start a worker by calling: UmbrellaTrioLottopar.Worker.start_link(arg)
      # {UmbrellaTrioLottopar.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: UmbrellaTrioLottopar.Supervisor)
  end
end
