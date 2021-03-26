defmodule RestaurantWeb.MealCreateController do
  use RestaurantWeb, :controller
  alias Restaurant.Meal
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %Meal{} = meal} <- Restaurant.create_meal(params) do
      conn
      |> put_status(:created)
      |> put_view(RestaurantWeb.MealView)
      |> render("create.json", meal: meal)
    end
  end
end
