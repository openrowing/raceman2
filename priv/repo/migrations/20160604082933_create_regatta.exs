defmodule Web.Repo.Migrations.CreateRegatta do
  use Ecto.Migration

  def change do
    create table(:regattas) do
      add :name, :string
      add :from, :date
      add :to, :date

      timestamps
    end

  end
end
