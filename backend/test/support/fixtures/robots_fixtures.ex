defmodule Backend.RobotsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Robots` context.
  """

  @doc """
  Generate a robot.
  """
  def robot_fixture(attrs \\ %{}) do
    {:ok, robot} =
      attrs
      |> Enum.into(%{
        frecuencia_sensor: "some frecuencia_sensor",
        notificaciones: true,
        velocidad: 120.5
      })
      |> Backend.Robots.create_robot()

    robot
  end
end
