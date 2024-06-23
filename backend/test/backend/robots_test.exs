defmodule Backend.RobotsTest do
  use Backend.DataCase

  alias Backend.Robots

  describe "robots" do
    alias Backend.Robots.Robot

    import Backend.RobotsFixtures

    @invalid_attrs %{frecuencia_sensor: nil, notificaciones: nil, velocidad: nil}

    test "list_robots/0 returns all robots" do
      robot = robot_fixture()
      assert Robots.list_robots() == [robot]
    end

    test "get_robot!/1 returns the robot with given id" do
      robot = robot_fixture()
      assert Robots.get_robot!(robot.id) == robot
    end

    test "create_robot/1 with valid data creates a robot" do
      valid_attrs = %{frecuencia_sensor: "some frecuencia_sensor", notificaciones: true, velocidad: 120.5}

      assert {:ok, %Robot{} = robot} = Robots.create_robot(valid_attrs)
      assert robot.frecuencia_sensor == "some frecuencia_sensor"
      assert robot.notificaciones == true
      assert robot.velocidad == 120.5
    end

    test "create_robot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Robots.create_robot(@invalid_attrs)
    end

    test "update_robot/2 with valid data updates the robot" do
      robot = robot_fixture()
      update_attrs = %{frecuencia_sensor: "some updated frecuencia_sensor", notificaciones: false, velocidad: 456.7}

      assert {:ok, %Robot{} = robot} = Robots.update_robot(robot, update_attrs)
      assert robot.frecuencia_sensor == "some updated frecuencia_sensor"
      assert robot.notificaciones == false
      assert robot.velocidad == 456.7
    end

    test "update_robot/2 with invalid data returns error changeset" do
      robot = robot_fixture()
      assert {:error, %Ecto.Changeset{}} = Robots.update_robot(robot, @invalid_attrs)
      assert robot == Robots.get_robot!(robot.id)
    end

    test "delete_robot/1 deletes the robot" do
      robot = robot_fixture()
      assert {:ok, %Robot{}} = Robots.delete_robot(robot)
      assert_raise Ecto.NoResultsError, fn -> Robots.get_robot!(robot.id) end
    end

    test "change_robot/1 returns a robot changeset" do
      robot = robot_fixture()
      assert %Ecto.Changeset{} = Robots.change_robot(robot)
    end
  end
end
