defmodule RepoTest do
  use ExUnit.Case

  test "valid conf" do
    refute Repo.conf == []
    refute Repo.priv == nil
  end
end
