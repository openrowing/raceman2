defmodule Web.Repo.Migrations.CreateRace do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :race_type_id, :bigint
      add :event_id, :bigint

      add :number, :string
      add :scheduled, :datetime
      add :started, :datetime

      timestamps
    end

  end
end
