defmodule Restaurant.Users.Get do
  alias Restaurant.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

  def by_id_with_meals(id) do
    case by_id(id) do
      {:error, _} = error -> error
      {:ok, user} -> load_meals(user)
    end
  end

  defp load_meals(user) do
    data =
      user
      |> Repo.preload(:meals)

    {:ok, data}
  end
end
