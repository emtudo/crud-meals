defmodule Restaurant do
  alias Restaurant.Meals.Create, as: MealCreate
  alias Restaurant.Meals.Delete, as: MealDelete
  alias Restaurant.Meals.Get, as: MealGet
  alias Restaurant.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(meal_id), to: MealGet, as: :by_id
  defdelegate delete_meal(meal_id), to: MealDelete, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
