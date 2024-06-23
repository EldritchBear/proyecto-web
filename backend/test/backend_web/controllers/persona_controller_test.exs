defmodule BackendWeb.PersonaControllerTest do
  use BackendWeb.ConnCase

  import Backend.PersonasFixtures

  alias Backend.Personas.Persona

  @create_attrs %{
    estado: "some estado",
    nombre: "some nombre"
  }
  @update_attrs %{
    estado: "some updated estado",
    nombre: "some updated nombre"
  }
  @invalid_attrs %{estado: nil, nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all personas", %{conn: conn} do
      conn = get(conn, ~p"/api/personas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create persona" do
    test "renders persona when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/personas", persona: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/personas/#{id}")

      assert %{
               "id" => ^id,
               "estado" => "some estado",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/personas", persona: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update persona" do
    setup [:create_persona]

    test "renders persona when data is valid", %{conn: conn, persona: %Persona{id: id} = persona} do
      conn = put(conn, ~p"/api/personas/#{persona}", persona: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/personas/#{id}")

      assert %{
               "id" => ^id,
               "estado" => "some updated estado",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, persona: persona} do
      conn = put(conn, ~p"/api/personas/#{persona}", persona: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete persona" do
    setup [:create_persona]

    test "deletes chosen persona", %{conn: conn, persona: persona} do
      conn = delete(conn, ~p"/api/personas/#{persona}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/personas/#{persona}")
      end
    end
  end

  defp create_persona(_) do
    persona = persona_fixture()
    %{persona: persona}
  end
end
