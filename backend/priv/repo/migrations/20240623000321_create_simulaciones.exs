defmodule Backend.Repo.Migrations.CreateSimulaciones do
  use Ecto.Migration

  def change do
    create table(:simulaciones) do
      add :nombre, :string

      timestamps(type: :utc_datetime)
    end
  end
end
