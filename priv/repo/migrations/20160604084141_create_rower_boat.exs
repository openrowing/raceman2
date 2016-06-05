defmodule Web.Repo.Migrations.CreateRowerBoat do
  use Ecto.Migration

  def change do
    create table(:rower_boats, primary_key: false) do
      add :boat_id, :bigint
      add :rower_id, :bigint

      add :position, :integer

      timestamps
    end

    create index(:rower_boats, [:boat_id, :rower_id], unique: true)

  end
end
