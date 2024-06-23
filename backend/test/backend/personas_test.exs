defmodule Backend.PersonasTest do
  use Backend.DataCase

  alias Backend.Personas

  describe "personas" do
    alias Backend.Personas.Persona

    import Backend.PersonasFixtures

    @invalid_attrs %{estado: nil, nombre: nil}

    test "list_personas/0 returns all personas" do
      persona = persona_fixture()
      assert Personas.list_personas() == [persona]
    end

    test "get_persona!/1 returns the persona with given id" do
      persona = persona_fixture()
      assert Personas.get_persona!(persona.id) == persona
    end

    test "create_persona/1 with valid data creates a persona" do
      valid_attrs = %{estado: "some estado", nombre: "some nombre"}

      assert {:ok, %Persona{} = persona} = Personas.create_persona(valid_attrs)
      assert persona.estado == "some estado"
      assert persona.nombre == "some nombre"
    end

    test "create_persona/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Personas.create_persona(@invalid_attrs)
    end

    test "update_persona/2 with valid data updates the persona" do
      persona = persona_fixture()
      update_attrs = %{estado: "some updated estado", nombre: "some updated nombre"}

      assert {:ok, %Persona{} = persona} = Personas.update_persona(persona, update_attrs)
      assert persona.estado == "some updated estado"
      assert persona.nombre == "some updated nombre"
    end

    test "update_persona/2 with invalid data returns error changeset" do
      persona = persona_fixture()
      assert {:error, %Ecto.Changeset{}} = Personas.update_persona(persona, @invalid_attrs)
      assert persona == Personas.get_persona!(persona.id)
    end

    test "delete_persona/1 deletes the persona" do
      persona = persona_fixture()
      assert {:ok, %Persona{}} = Personas.delete_persona(persona)
      assert_raise Ecto.NoResultsError, fn -> Personas.get_persona!(persona.id) end
    end

    test "change_persona/1 returns a persona changeset" do
      persona = persona_fixture()
      assert %Ecto.Changeset{} = Personas.change_persona(persona)
    end
  end
end
