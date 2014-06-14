defmodule Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE IF NOT EXISTS teams (
      id serial primary key,
      name character varying(255),
      city character varying(255),
      abbreviation character varying(255),
      conference character varying(255),
      division character varying(255),
      created_at timestamp without time zone,
      updated_at timestamp without time zone
    )
    """
  end

  def down do
    """
    DROP TABLE teams
    """
  end
end
