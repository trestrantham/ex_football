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
  def import(source_file) do
    csv = CSV.decode(File.stream!(source_file), columns: true, strip: true)
    csv |> Enum.each(fn(row) ->
      team = %Team{
        name: row["name"],
        city: row["city"],
        abbreviation: row["abbreviation"],
        conference: row["conference"],
        division: row["division"]
      }

      validation = Team.validate(team)

      query = from t in Team,
              where: t.name == ^team.name
                and t.city == ^team.city,
              select: t.id
      db_team = Repo.all(query) |> Enum.count

      cond do
        validation != [] ->
          raise "Invalid Team"
        db_team > 0 ->
          IO.puts "Duplicate Team #{team.city} #{team.name}; Skipping"
        true ->
          IO.puts "Inserting Team #{team.city} #{team.name}"
          Repo.insert(team)
      end
    end)
  end
end
