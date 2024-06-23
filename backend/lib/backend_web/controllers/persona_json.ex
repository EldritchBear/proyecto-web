defmodule BackendWeb.PersonaJSON do
  alias Backend.Personas.Persona

  @doc """
  Renders a list of personas.
  """
  def index(%{personas: personas}) do
    %{data: for(persona <- personas, do: data(persona))}
  end

  @doc """
  Renders a single persona.
  """
  def show(%{persona: persona}) do
    %{data: data(persona)}
  end

  defp data(%Persona{} = persona) do
    %{
      id: persona.id,
      nombre: persona.nombre,
      estado: persona.estado
    }
  end
end
