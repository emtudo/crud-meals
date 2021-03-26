defmodule RestaurantWeb.MealViewTest do
  use RestaurantWeb.ConnCase, async: true
  alias RestaurantWeb.MealView

  import Phoenix.View
  import Restaurant.Factory

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealView, "create.json", meal: meal)

    expected_response = %{
      message: "Meal created!",
      meal: %Restaurant.Meal{
        id: "183143ce-99a2-4c36-a188-5b4c832e6ba3",
        descricao: "Arroz com Feijão",
        data: "2021-03-25T18:00:00",
        calorias: 20
      }
    }

    assert response == expected_response
  end

  test "renders meal.json" do
    meal = build(:meal)

    response = render(MealView, "meal.json", meal: meal)

    expected_response = %{
      meal: %Restaurant.Meal{
        id: "183143ce-99a2-4c36-a188-5b4c832e6ba3",
        descricao: "Arroz com Feijão",
        data: "2021-03-25T18:00:00",
        calorias: 20
      }
    }

    assert response == expected_response
  end
end
