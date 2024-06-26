defmodule BackendWeb.RobotJSON do
  alias Backend.Robots.Robot

  @doc """
  Renders a list of robots.
  """
  def index(%{robots: robots}) do
    %{data: for(robot <- robots, do: data(robot))}
  end

  @doc """
  Renders a single robot.
  """
  def show(%{robot: robot}) do
    %{data: data(robot)}
  end

  defp data(%Robot{} = robot) do
    %{
      id: robot.id,
      frecuencia_sensor: robot.frecuencia_sensor,
      velocidad: robot.velocidad,
      notificaciones: robot.notificaciones
    }
  end

  # @doc """
  # Renders a success message.
  # """
  # def success(%{message: message}) do
  #   %{data: message}
  # end
end
