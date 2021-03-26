defmodule RestaurantWeb.ErrorViewTest do
  use RestaurantWeb.ConnCase, async: true
  alias RestaurantWeb.ErrorView

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View
  import Restaurant.Factory

  test "renders error.json changeset" do
    params = build(:meal_params, descricao: "teste")

    meal =
      params
      |> Restaurant.Meal.changeset()

    response = render(ErrorView, "error.json", %{result: meal})

    expected_response = %{errors: %{descricao: ["should be at least 10 character(s)"]}}

    assert response == expected_response
  end

  test "renders error.json" do
    assert render(ErrorView, "error.json", %{result: "Not Found"}) == %{
             message: "Not Found"
           }
  end

  test "renders 500.json" do
    assert render(ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
