defmodule BackendWeb.SimulacionJSON do
  alias Backend.Simulaciones.Simulacion

  @doc """
  Renders a list of simulaciones.
  """
  def index(%{simulaciones: simulaciones}) do
    %{data: for(simulacion <- simulaciones, do: data(simulacion))}
  end

  @doc """
  Renders a single simulacion.
  """
  def show(%{simulacion: simulacion}) do
    %{data: data(simulacion)}
  end

  defp data(%Simulacion{} = simulacion) do
    %{
      id: simulacion.id,
      nombre: simulacion.nombre
    }
  end
end
