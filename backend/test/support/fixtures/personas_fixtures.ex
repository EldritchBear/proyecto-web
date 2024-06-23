defmodule Backend.PersonasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Backend.Personas` context.
  """

  @doc """
  Generate a persona.
  """
  def persona_fixture(attrs \\ %{}) do
    {:ok, persona} =
      attrs
      |> Enum.into(%{
        estado: "some estado",
        nombre: "some nombre"
      })
      |> Backend.Personas.create_persona()

    persona
  end
end
