defmodule Backend.Robots.Robot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "robots" do
    field :frecuencia_sensor, :string
    field :notificaciones, :boolean, default: false
    field :velocidad, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(robot, attrs) do
    robot
    |> cast(attrs, [:frecuencia_sensor, :velocidad, :notificaciones])
    |> validate_required([:frecuencia_sensor, :velocidad, :notificaciones])
  end
end
