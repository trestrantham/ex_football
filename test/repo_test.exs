defmodule RepoTest do
  use ExUnit.Case

  test "valid conf" do
    assert Repo.conf == [username: "postgres", password: "postgres", hostname: "localhost", database: "ex_football"]
    refute Repo.priv == nil
  end
end
