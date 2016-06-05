defmodule Web.Repo.Migrations.CreateBoat do
  use Ecto.Migration

  def change do
    create table(:boats) do
      add :event_id, :bigint
      add :number, :integer
      add :team_name, :string
      add :country, :string
      add :team_boat_number, :integer
      add :disqualified, :string
      add :withdrawn, :boolean, default: false
      add :registered_late, :boolean, default: false
      add :reregistered, :boolean, default: false

      timestamps
    end

  end
end
