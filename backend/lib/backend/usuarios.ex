defmodule Backend.Usuarios do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Usuarios
  alias Backend.Repo
  alias Backend.Services.Authenticator

  schema "usuarios" do
    field :comuna, :string
    field :email, :string
    field :nombre, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :region, :string
    has_many :auth_tokens, Backend.AuthToken

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(usuarios, attrs) do
    usuarios
    |> cast(attrs, [:nombre, :region, :comuna, :email, :password])
    |> validate_required([:nombre, :region, :comuna, :email, :password])
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  # genera un hash para la contraseña
  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def sign_in(email, password) do
    case Comeonin.Bcrypt.check_pass(Repo.get_by(Usuarios, email: email), password) do
      {:ok, user} ->
        token = Authenticator.generate_token(user)
        Repo.insert(Ecto.build_assoc(user, :auth_tokens, %{token: token}))

      err ->
        err
    end
  end

  def sign_out(conn) do
    case Authenticator.get_auth_token(conn) do
      {:ok, token} ->
        case Repo.get_by(AuthToken, %{token: token}) do
          nil -> {:error, :not_found}
          auth_token -> Repo.delete(auth_token)
        end

      error ->
        error
    end
  end
end
