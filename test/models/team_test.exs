defmodule TeamTest do
  use ExUnit.Case

  setup do
    Repo.delete_all(Team)

    :ok
  end

  test "invalid Team" do
    team = %Team{name: "Bad Team"}

    refute Team.validate(team) == []
  end

  test "valid Team" do
    team = %Team{
             name: "Name",
             city: "City",
             abbreviation: "Abbreviation",
             conference: "Conference",
             division: "Division"
           }

    assert Team.validate(team) == []
  end

  test "successful import of teams csv" do
    original_count = Repo.all(Team) |> Enum.count

    "test/fixtures/team_test_success.csv" |> Team.import(Repo)

    test_count = Repo.all(Team) |> Enum.count
    assert (test_count - original_count) == 2
  end

  test "duplicate import of teams csv" do
    original_count = Repo.all(Team) |> Enum.count

    "test/fixtures/team_test_success.csv" |> Team.import(Repo)

    test_count = Repo.all(Team) |> Enum.count
    assert (test_count - original_count) == 2

    "test/fixtures/team_test_success.csv" |> Team.import(Repo)

    duplicate_count = Repo.all(Team) |> Enum.count
    assert test_count == duplicate_count
  end

  test "import of teams csv failure" do
    assert_raise RuntimeError, fn ->
      "test/fixtures/team_test_fail.csv" |> Team.import(Repo)
    end
  end
end
