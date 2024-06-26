defmodule BackendWeb.Plugs.Authenticate do
  import Plug.Conn
  def init(default), do: default
  def call(conn, _default) do
    case Backend.Services.Authenticator.get_auth_token(conn) do
      {:ok, token} ->
        case Backend.Repo.get_by(Backend.AuthToken, %{token: token, revoked: false}) |> Backend.Repo.preload(:usuarios) do
          nil -> unauthorized(conn)
          auth_token -> authorized(conn, auth_token.usuarios)
        end
      _ -> unauthorized(conn)
    end
  end
  defp authorized(conn, user) do
    conn 
    |> assign(:signed_in, true)
    |> assign(:signed_user, user)
  end
  defp unauthorized(conn) do
    conn |> send_resp(401, "Unauthorized") |> halt()
  end
end
