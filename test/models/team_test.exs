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

  test "import of teams csv" do
    original_count = Repo.all(Team) |> Enum.count

    "test/fixtures/team_test.csv" |> Team.import

    test_count = Repo.all(Team) |> Enum.count
    assert (test_count - original_count) == 2
  end
end
