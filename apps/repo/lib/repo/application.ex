defmodule Repo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Repo.Repo,
      {DNSCluster,
       query: Application.get_env(:repo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Repo.PubSub}
      # Start a worker by calling: Repo.Worker.start_link(arg)
      # {Repo.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Repo.Supervisor)
  end
end
