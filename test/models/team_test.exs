defmodule TeamTest do
  use ExUnit.Case

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
end
