defmodule Web.Repo.Migrations.CreateRaceType do
  use Ecto.Migration

  def change do
    create table(:race_types) do
      add :name, :string
      add :abbr, :string

      timestamps
    end

  end
end
