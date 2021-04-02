defmodule RestaurantWeb.UserCreateController do
  alias Restaurant.User
  use RestaurantWeb, :controller
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %User{} = user} <- Restaurant.create_user(params) do
      conn
      |> put_status(:created)
      |> put_view(RestaurantWeb.UserView)
      |> render("create.json", user: user)
    end
  end
end
