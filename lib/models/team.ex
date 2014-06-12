defmodule Team do
  use Ecto.Model

  schema "teams" do
    field :name
    field :city
    field :abbreviation
    field :conference
    field :division
  end

  validate team,
    name:         present(),
    city:         present(),
    abbreviation: present(),
    conference:   present(),
    division:     present()
end
