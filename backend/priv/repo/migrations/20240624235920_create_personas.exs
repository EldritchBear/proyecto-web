defmodule Backend.Repo.Migrations.CreatePersonas do
  use Ecto.Migration

  def change do
    create table(:personas) do
      add :nombre, :string
      add :estado, :string
      add :simulacion_id, references(:simulaciones, on_delete: :nothing)
      add :caso, :string

      timestamps(type: :utc_datetime)
    end
  end
end
