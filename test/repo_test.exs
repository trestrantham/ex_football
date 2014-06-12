defmodule RepoTest do
  use ExUnit.Case

  test "valid conf" do
    assert Repo.conf == [password: "postgres", username: "postgres", hostname: "localhost", database: "football"]
  end
end
