defmodule RestaurantWeb.MealDeleteController do
  use RestaurantWeb, :controller

  alias Restaurant.Meal
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => meal_id}) do
    with {:ok, %Meal{}} <- Restaurant.delete_meal(meal_id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
