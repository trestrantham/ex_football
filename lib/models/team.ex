defmodule Team do
  import Ecto.Query, only: [from: 2]

  use Ecto.Model
  use Cesso

  schema "teams" do
    field :name
    field :city
    field :abbreviation
    field :conference
    field :division
    field :created_at, :datetime
    field :updated_at, :datetime
  end

  validate team,
    name:         present(),
    city:         present(),
    abbreviation: present(),
    conference:   present(),
    division:     present()

  # name,city,abbreviation,conference,division
  def import(source_file, repo) do
    source_file
    |> File.stream!
    |> CSV.decode(columns: true, strip: true)
    |> Enum.each(fn row -> import_csv_row(row, repo) end)
  end

  def by_name_and_city(name, city) do
    from t in Team,
    where: t.name == ^name
      and t.city == ^city,
    select: t.id
  end

  defp import_csv_row(row, repo) do
    team = %Team{ name: row["name"],
                  city: row["city"],
                  abbreviation: row["abbreviation"],
                  conference: row["conference"],
                  division: row["division"] }

    cond do
      Team.validate(team) != [] -> raise "Invalid Team"
      repo.all(by_name_and_city(team.name, team.city)) |> Enum.count > 0 ->
        IO.puts "Duplicate Team #{team.city} #{team.name}; Skipping"
      true ->
        IO.puts "Inserting Team #{team.city} #{team.name}"
        repo.insert(team)
    end
  end
end
