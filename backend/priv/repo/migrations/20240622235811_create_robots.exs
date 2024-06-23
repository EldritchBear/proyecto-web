defmodule Backend.Repo.Migrations.CreateRobots do
  use Ecto.Migration

  def change do
    create table(:robots) do
      add :frecuencia_sensor, :string
      add :velocidad, :float
      add :notificaciones, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
