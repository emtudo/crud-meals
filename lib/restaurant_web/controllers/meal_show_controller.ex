defmodule RestaurantWeb.MealShowController do
  use RestaurantWeb, :controller

  alias Restaurant.Meal
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => meal_id}) do
    with {:ok, %Meal{} = meal} <- Restaurant.get_meal_by_id(meal_id) do
      conn
      |> put_view(RestaurantWeb.MealView)
      |> render("meal.json", meal: meal)
    end
  end
end
