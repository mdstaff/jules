defmodule MyCardGame.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MyCardGameWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyCardGame.PubSub},
      # Start the Endpoint (http/https)
      MyCardGameWeb.Endpoint
      # Start a worker by calling: MyCardGame.Worker.start_link(arg)
      # {MyCardGame.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyCardGame.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # wheneverthe application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyCardGameWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
