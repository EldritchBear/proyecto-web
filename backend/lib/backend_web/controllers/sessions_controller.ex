defmodule BackendWeb.SessionsController do
  use BackendWeb, :controller
  alias Backend.Usuarios

  def create(conn, %{"email" => email, "password" => password}) do
    case Usuarios.sign_in(email, password) do
      {:ok, auth_token} ->
        conn
        |> put_status(:ok)
        |> json(%{auth_token: auth_token.token})

      {:error, reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: reason})
    end
  end

  def delete(conn, _) do
    case Usuarios.sign_out(conn) do
      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: reason})

      {:ok, _} ->
        conn
        |> put_status(:no_content)
        |> json(%{})
    end
  end
end
