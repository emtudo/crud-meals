defmodule RestaurantWeb.FallbackController do
  alias Restaurant.Error
  alias RestaurantWeb.ErrorView
  use RestaurantWeb, :controller

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
