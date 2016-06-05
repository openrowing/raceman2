defmodule Web.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :regatta_id, :bigint
      add :name, :string
      add :abbr, :string
      add :number, :string

      timestamps
    end

  end
end
