defmodule Backend.Simulaciones do
  @moduledoc """
  The Simulaciones context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Simulaciones.Simulacion

  @doc """
  Returns the list of simulaciones.

  ## Examples

      iex> list_simulaciones()
      [%Simulacion{}, ...]

  """
  def list_simulaciones do
    Repo.all(Simulacion)
  end

  @doc """
  Gets a single simulacion.

  Raises `Ecto.NoResultsError` if the Simulacion does not exist.

  ## Examples

      iex> get_simulacion!(123)
      %Simulacion{}

      iex> get_simulacion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_simulacion!(id), do: Repo.get!(Simulacion, id)

  @doc """
  Creates a simulacion.

  ## Examples

      iex> create_simulacion(%{field: value})
      {:ok, %Simulacion{}}

      iex> create_simulacion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_simulacion(attrs \\ %{}) do
    %Simulacion{}
    |> Simulacion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a simulacion.

  ## Examples

      iex> update_simulacion(simulacion, %{field: new_value})
      {:ok, %Simulacion{}}

      iex> update_simulacion(simulacion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_simulacion(%Simulacion{} = simulacion, attrs) do
    simulacion
    |> Simulacion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a simulacion.

  ## Examples

      iex> delete_simulacion(simulacion)
      {:ok, %Simulacion{}}

      iex> delete_simulacion(simulacion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_simulacion(%Simulacion{} = simulacion) do
    Repo.delete(simulacion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking simulacion changes.

  ## Examples

      iex> change_simulacion(simulacion)
      %Ecto.Changeset{data: %Simulacion{}}

  """
  def change_simulacion(%Simulacion{} = simulacion, attrs \\ %{}) do
    Simulacion.changeset(simulacion, attrs)
  end
end
