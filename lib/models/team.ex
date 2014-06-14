defmodule Team do
  use Ecto.Model

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
end
