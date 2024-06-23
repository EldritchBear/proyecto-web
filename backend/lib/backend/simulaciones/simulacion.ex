defmodule Backend.Simulaciones.Simulacion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "simulaciones" do
    field :nombre, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(simulacion, attrs) do
    simulacion
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
