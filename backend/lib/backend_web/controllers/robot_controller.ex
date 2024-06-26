defmodule BackendWeb.RobotController do
  use BackendWeb, :controller

  alias Backend.Robots
  alias Backend.Robots.Robot

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    robots = Robots.list_robots()
    render(conn, BackendWeb.RobotJSON, :index, robots: robots)
  end

  def create(conn, %{"robot" => robot_params}) do
    with {:ok, %Robot{} = robot} <- Robots.create_robot(robot_params) do
      conn
      |> put_status(:created)
      |> render(BackendWeb.RobotJSON, :show, robot: robot)
    end
  end

  def show(conn, %{"id" => id}) do
    robot = Robots.get_robot!(id)
    render(conn, BackendWeb.RobotJSON, :show, robot: robot)
  end

  def update(conn, %{"id" => id, "robot" => robot_params}) do
    robot = Robots.get_robot!(id)

    with {:ok, %Robot{} = robot} <- Robots.update_robot(robot, robot_params) do
      render(conn, BackendWeb.RobotJSON, :show, robot: robot)
    end
  end

  def delete(conn, %{"id" => id}) do
    robot = Robots.get_robot!(id)

    with {:ok, %Robot{}} <- Robots.delete_robot(robot) do
      send_resp(conn, :no_content, "")
    end
  end
end
