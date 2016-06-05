defmodule Web.Repo.Migrations.CreateRower do
  use Ecto.Migration

  def change do
    create table(:rowers) do
      add :regatta_id, :bigint
      add :forename, :string
      add :surname, :string
      add :license, :string
      add :year, :integer

      timestamps
    end

  end
end
