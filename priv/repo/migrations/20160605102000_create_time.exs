defmodule Web.Repo.Migrations.CreateTime do
  use Ecto.Migration

  def change do
    create table(:times, primary_key: false) do
      add :race_boat_id, :bigint
      add :measuring_point_id, :bigint
      add :time, :time

      timestamps
    end

    create index(:times, [:race_boat_id, :measuring_point_id], unique: true)

  end
end
