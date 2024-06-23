defmodule Backend.SimulacionesTest do
  use Backend.DataCase

  alias Backend.Simulaciones

  describe "simulaciones" do
    alias Backend.Simulaciones.Simulacion

    import Backend.SimulacionesFixtures

    @invalid_attrs %{nombre: nil}

    test "list_simulaciones/0 returns all simulaciones" do
      simulacion = simulacion_fixture()
      assert Simulaciones.list_simulaciones() == [simulacion]
    end

    test "get_simulacion!/1 returns the simulacion with given id" do
      simulacion = simulacion_fixture()
      assert Simulaciones.get_simulacion!(simulacion.id) == simulacion
    end

    test "create_simulacion/1 with valid data creates a simulacion" do
      valid_attrs = %{nombre: "some nombre"}

      assert {:ok, %Simulacion{} = simulacion} = Simulaciones.create_simulacion(valid_attrs)
      assert simulacion.nombre == "some nombre"
    end

    test "create_simulacion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Simulaciones.create_simulacion(@invalid_attrs)
    end

    test "update_simulacion/2 with valid data updates the simulacion" do
      simulacion = simulacion_fixture()
      update_attrs = %{nombre: "some updated nombre"}

      assert {:ok, %Simulacion{} = simulacion} = Simulaciones.update_simulacion(simulacion, update_attrs)
      assert simulacion.nombre == "some updated nombre"
    end

    test "update_simulacion/2 with invalid data returns error changeset" do
      simulacion = simulacion_fixture()
      assert {:error, %Ecto.Changeset{}} = Simulaciones.update_simulacion(simulacion, @invalid_attrs)
      assert simulacion == Simulaciones.get_simulacion!(simulacion.id)
    end

    test "delete_simulacion/1 deletes the simulacion" do
      simulacion = simulacion_fixture()
      assert {:ok, %Simulacion{}} = Simulaciones.delete_simulacion(simulacion)
      assert_raise Ecto.NoResultsError, fn -> Simulaciones.get_simulacion!(simulacion.id) end
    end

    test "change_simulacion/1 returns a simulacion changeset" do
      simulacion = simulacion_fixture()
      assert %Ecto.Changeset{} = Simulaciones.change_simulacion(simulacion)
    end
  end
end
