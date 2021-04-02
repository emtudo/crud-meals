defmodule RestaurantWeb.UserUpdateController do
  alias Restaurant.User
  use RestaurantWeb, :controller
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %User{} = user} <- Restaurant.update_user(params) do
      conn
      |> put_status(:ok)
      |> put_view(RestaurantWeb.UserView)
      |> render("user.json", user: user)
    end
  end
end
