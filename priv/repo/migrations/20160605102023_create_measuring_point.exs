defmodule Web.Repo.Migrations.CreateMeasuringPoint do
  use Ecto.Migration

  def change do
    create table(:measuring_points) do
      add :position, :integer

      timestamps
    end

  end
end
