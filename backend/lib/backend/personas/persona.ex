defmodule Backend.Personas.Persona do
  use Ecto.Schema
  import Ecto.Changeset

  schema "personas" do
    field :estado, :string
    field :nombre, :string
    belongs_to :simulacion, Backend.Simulaciones.Simulacion
    field :caso, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(persona, attrs) do
    persona
    |> cast(attrs, [:nombre, :estado, :simulacion_id, :caso])
    |> validate_required([:nombre, :estado])
  end
end
