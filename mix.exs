defmodule Football.Mixfile do
  use Mix.Project

  def project do
    [
      app: :football,
      version: "0.0.1",
      elixir: "~> 0.14.1",
      deps: deps,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: { Football, [] },
      applications: [
        :postgrex,
        :ecto
      ]
    ]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      { :excoveralls, github: "parroty/excoveralls" },
      { :postgrex, "~> 0.5.1" },
      { :ecto, github: "elixir-lang/ecto" },
      { :cesso, github: "meh/cesso" }
    ]
  end
end
