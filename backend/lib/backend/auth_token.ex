defmodule Backend.AuthToken do
  alias Backend.Usuarios
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:token, :revoked, :revoked_at]}
  schema "auth_tokens" do
    field :revoked, :boolean, default: false
    field :revoked_at, :utc_datetime
    field :token, :string
    belongs_to :usuarios, Usuarios

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(auth_token, attrs) do
    auth_token
    |> cast(attrs, [:token, :revoked, :revoked_at])
    |> validate_required([:token, :revoked, :revoked_at])
    |> unique_constraint(:token)
  end
end
