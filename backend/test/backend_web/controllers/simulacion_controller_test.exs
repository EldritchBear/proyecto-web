defmodule BackendWeb.SimulacionControllerTest do
  use BackendWeb.ConnCase

  import Backend.SimulacionesFixtures

  alias Backend.Simulaciones.Simulacion

  @create_attrs %{
    nombre: "some nombre"
  }
  @update_attrs %{
    nombre: "some updated nombre"
  }
  @invalid_attrs %{nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all simulaciones", %{conn: conn} do
      conn = get(conn, ~p"/api/simulaciones")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create simulacion" do
    test "renders simulacion when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/simulaciones", simulacion: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/simulaciones/#{id}")

      assert %{
               "id" => ^id,
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/simulaciones", simulacion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update simulacion" do
    setup [:create_simulacion]

    test "renders simulacion when data is valid", %{conn: conn, simulacion: %Simulacion{id: id} = simulacion} do
      conn = put(conn, ~p"/api/simulaciones/#{simulacion}", simulacion: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/simulaciones/#{id}")

      assert %{
               "id" => ^id,
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, simulacion: simulacion} do
      conn = put(conn, ~p"/api/simulaciones/#{simulacion}", simulacion: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete simulacion" do
    setup [:create_simulacion]

    test "deletes chosen simulacion", %{conn: conn, simulacion: simulacion} do
      conn = delete(conn, ~p"/api/simulaciones/#{simulacion}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/simulaciones/#{simulacion}")
      end
    end
  end

  defp create_simulacion(_) do
    simulacion = simulacion_fixture()
    %{simulacion: simulacion}
  end
end
