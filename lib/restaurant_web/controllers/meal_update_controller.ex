defmodule RestaurantWeb.MealUpdateController do
  use RestaurantWeb, :controller

  alias Restaurant.Meal
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %Meal{} = meal} <- Restaurant.update_meal(params) do
      conn
      |> put_view(RestaurantWeb.MealView)
      |> render("meal.json", meal: meal)
    end
  end
end
