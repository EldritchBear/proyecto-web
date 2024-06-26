defmodule BackendWeb.PersonaController do
  use BackendWeb, :controller

  alias Backend.Personas
  alias Backend.Personas.Persona

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    personas = Personas.list_personas()
    render(conn, BackendWeb.PersonaJSON, :index, personas: personas)
  end

  def create(conn, %{"persona" => persona_params}) do
    with {:ok, %Persona{} = persona} <- Personas.create_persona(persona_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.persona_path(conn, :show, persona))
      |> render(BackendWeb.PersonaJSON, :show, persona: persona)
    end
  end

  def show(conn, %{"id" => id}) do
    persona = Personas.get_persona!(id)
    render(conn, BackendWeb.PersonaJSON, :show, persona: persona)
  end

  def update(conn, %{"id" => id, "persona" => persona_params}) do
    persona = Personas.get_persona!(id)

    with {:ok, %Persona{} = persona} <- Personas.update_persona(persona, persona_params) do
      render(conn, BackendWeb.PersonaJSON, :show, persona: persona)
    end
  end

  def delete(conn, %{"id" => id}) do
    persona = Personas.get_persona!(id)

    with {:ok, %Persona{}} <- Personas.delete_persona(persona) do
      send_resp(conn, :no_content, "")
    end
  end
end
