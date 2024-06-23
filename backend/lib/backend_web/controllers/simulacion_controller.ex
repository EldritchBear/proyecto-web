defmodule BackendWeb.SimulacionController do
  use BackendWeb, :controller

  alias Backend.Simulaciones
  alias Backend.Simulaciones.Simulacion

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    simulaciones = Simulaciones.list_simulaciones()
    render(conn, :index, simulaciones: simulaciones)
  end

  def create(conn, %{"simulacion" => simulacion_params}) do
    with {:ok, %Simulacion{} = simulacion} <- Simulaciones.create_simulacion(simulacion_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/simulaciones/#{simulacion}")
      |> render(:show, simulacion: simulacion)
    end
  end

  def show(conn, %{"id" => id}) do
    simulacion = Simulaciones.get_simulacion!(id)
    render(conn, :show, simulacion: simulacion)
  end

  def update(conn, %{"id" => id, "simulacion" => simulacion_params}) do
    simulacion = Simulaciones.get_simulacion!(id)

    with {:ok, %Simulacion{} = simulacion} <- Simulaciones.update_simulacion(simulacion, simulacion_params) do
      render(conn, :show, simulacion: simulacion)
    end
  end

  def delete(conn, %{"id" => id}) do
    simulacion = Simulaciones.get_simulacion!(id)

    with {:ok, %Simulacion{}} <- Simulaciones.delete_simulacion(simulacion) do
      send_resp(conn, :no_content, "")
    end
  end
end
