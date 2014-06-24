defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  def conf(env), do: parse_url url(env)

  defp url(:dev),  do: "ecto://postgres:postgres@localhost/ex_football_dev"
  defp url(:test), do: "ecto://postgres:@localhost/ex_football_test"
  defp url(:prod), do: "ecto://postgres:postgres@localhost/ex_football_prod"

  def priv do
    app_dir(:football, "priv/repo")
  end
end
