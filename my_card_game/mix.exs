defmodule MyCardGame.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_card_game,
      version: "0.1.0",
      elixir: "~> 1.15", # Target Elixir version
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MyCardGame.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.7.11"},
      {:phoenix_live_view, "~> 0.20.1"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      # {:jason, "~> 1.2"}, # Usually included, but keeping minimal for simulation
      # {:plug_cowboy, "~> 2.5"} # Usually included
    ]
  end
end
