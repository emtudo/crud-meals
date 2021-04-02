defmodule RestaurantWeb.UserShowController do
  use RestaurantWeb, :controller

  alias Restaurant.User
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => user_id}) do
    with {:ok, %User{} = user} <- Restaurant.get_user_by_id(user_id) do
      conn
      |> put_view(RestaurantWeb.UserView)
      |> render("user.json", user: user)
    end
  end
end
