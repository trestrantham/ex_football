defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://postgres:postgres@localhost/ex_football"
  end

  def priv do
    app_dir(:football, "priv/repo")
  end
end
