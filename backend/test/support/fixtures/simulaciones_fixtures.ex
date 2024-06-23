defmodule Backend.SimulacionesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Simulaciones` context.
  """

  @doc """
  Generate a simulacion.
  """
  def simulacion_fixture(attrs \\ %{}) do
    {:ok, simulacion} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre"
      })
      |> Backend.Simulaciones.create_simulacion()

    simulacion
  end
end
