defmodule Restaurant.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :nome, :string, size: 60
      add :cpf, :string, size: 11
      add :email, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:cpf])
  end
end
