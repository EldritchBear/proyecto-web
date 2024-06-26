defmodule BackendWeb.SessionsController do
  use BackendWeb, :controller
  alias Backend.Repo
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

  def new(conn, %{"usuario" => usuario_params}) do
    with {:ok, %Usuarios{} = _usuario} <-
           %Usuarios{} |> Usuarios.changeset(usuario_params) |> Repo.insert() do
      conn
      |> put_status(:created)
      |> json(%{message: "User created successfully"})
    else
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "User creation failed", details: changeset})
    end
  end

  def get_data(conn, _params) do
    IO.inspect(conn)

    case conn.assigns[:signed_user] do
      nil ->
        conn
        |> send_resp(401, "Unauthorized")

      user ->
        conn
        |> put_status(:ok)
        |> json(%{
          nombre: user.nombre,
          email: user.email,
          comuna: user.comuna,
          region: user.region,
        })
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
