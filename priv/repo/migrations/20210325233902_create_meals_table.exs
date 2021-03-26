defmodule Restaurant.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals do
      add :descricao, :string, size: 255
      add :data, :timestamp
      add :calorias, :integer

      timestamps()
    end

    create index(:meals, [:data])
  end
end
