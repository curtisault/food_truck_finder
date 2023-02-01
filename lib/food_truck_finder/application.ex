defmodule FoodTruckFinder.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FoodTruckFinderWeb.Telemetry,
      # Start the Ecto repository
      FoodTruckFinder.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FoodTruckFinder.PubSub},
      # Start Finch
      {Finch, name: FoodTruckFinder.Finch},
      # Start the Endpoint (http/https)
      FoodTruckFinderWeb.Endpoint
      # Start a worker by calling: FoodTruckFinder.Worker.start_link(arg)
      # {FoodTruckFinder.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTruckFinder.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTruckFinderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
