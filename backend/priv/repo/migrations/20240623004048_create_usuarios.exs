defmodule Backend.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombre, :string, null: false
      add :region, :string, null: false
      add :comuna, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:usuarios, [:email])
  end
end
