defmodule RestaurantWeb.UserMealsController do
  alias Restaurant.User
  use RestaurantWeb, :controller
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => user_id}) do
    with {:ok, %User{} = user} <- Restaurant.get_user_with_meals(user_id) do
      conn
      |> put_status(:ok)
      |> put_view(RestaurantWeb.UserView)
      |> render("user_meals.json", user: user)
    end
  end
end
