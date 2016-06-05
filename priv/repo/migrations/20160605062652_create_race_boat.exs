defmodule Web.Repo.Migrations.CreateRaceBoat do
  use Ecto.Migration

  def change do
    create table(:race_boats) do
      add :lane_scheduled, :integer
      add :lane_started, :integer
      add :race_id, :bigint
      add :boat_id, :bigint
      add :place, :integer

      timestamps
    end

    create index(:race_boats, [:race_id, :boat_id], unique: true)

  end
end
