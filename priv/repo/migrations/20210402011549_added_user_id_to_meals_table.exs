defmodule Restaurant.Repo.Migrations.AddedUserIdToMealsTable do
  use Ecto.Migration

  def change do
    alter table(:meals) do
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create index(:meals, :user_id)
  end
end
