defmodule Backend.Robots do
  @moduledoc """
  The Robots context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Robots.Robot

  @doc """
  Returns the list of robots.

  ## Examples

      iex> list_robots()
      [%Robot{}, ...]

  """
  def list_robots do
    Repo.all(Robot)
  end

  @doc """
  Gets a single robot.

  Raises `Ecto.NoResultsError` if the Robot does not exist.

  ## Examples

      iex> get_robot!(123)
      %Robot{}

      iex> get_robot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_robot!(id), do: Repo.get!(Robot, id)

  @doc """
  Creates a robot.

  ## Examples

      iex> create_robot(%{field: value})
      {:ok, %Robot{}}

      iex> create_robot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_robot(attrs \\ %{}) do
    %Robot{}
    |> Robot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a robot.

  ## Examples

      iex> update_robot(robot, %{field: new_value})
      {:ok, %Robot{}}

      iex> update_robot(robot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_robot(%Robot{} = robot, attrs) do
    robot
    |> Robot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a robot.

  ## Examples

      iex> delete_robot(robot)
      {:ok, %Robot{}}

      iex> delete_robot(robot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_robot(%Robot{} = robot) do
    Repo.delete(robot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking robot changes.

  ## Examples

      iex> change_robot(robot)
      %Ecto.Changeset{data: %Robot{}}

  """
  def change_robot(%Robot{} = robot, attrs \\ %{}) do
    Robot.changeset(robot, attrs)
  end
end
