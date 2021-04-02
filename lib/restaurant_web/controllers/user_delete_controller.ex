defmodule RestaurantWeb.UserDeleteController do
  use RestaurantWeb, :controller

  alias Restaurant.User
  alias RestaurantWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, %{"id" => user_id}) do
    with {:ok, %User{}} <- Restaurant.delete_user(user_id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
