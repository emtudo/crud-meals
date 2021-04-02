defmodule Restaurant do
  alias Restaurant.Users.Create, as: UserCreate
  alias Restaurant.Users.Delete, as: UserDelete
  alias Restaurant.Users.Get, as: UserGet
  alias Restaurant.Users.Update, as: UserUpdate

  alias Restaurant.Meals.Create, as: MealCreate
  alias Restaurant.Meals.Delete, as: MealDelete
  alias Restaurant.Meals.Get, as: MealGet
  alias Restaurant.Meals.Update, as: MealUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(user_id), to: UserGet, as: :by_id
  defdelegate delete_user(user_id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate get_user_with_meals(user_id), to: UserGet, as: :by_id_with_meals

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(meal_id), to: MealGet, as: :by_id
  defdelegate delete_meal(meal_id), to: MealDelete, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
