defmodule RestaurantWeb.MealDeleteControllerTest do
  use RestaurantWeb.ConnCase, async: true

  import Restaurant.Factory

  describe "handle/2" do
    test "when there is a meal with the given id, deletes the meal", %{conn: conn} do
      meal = insert(:meal)

      response =
        conn
        |> delete(Routes.meal_delete_path(conn, :handle, meal.id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there isnt meal with the given id, returns error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.meal_delete_path(conn, :handle, "183143ce-99a2-4c36-a188-5b4c832e6ba3"))
        |> response(:not_found)

      expected_resposne = "{\"message\":\"Meal not found.\"}"

      assert response == expected_resposne
    end

    test "when id is invalid, returns error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.meal_delete_path(conn, :handle, "783143ce"))
        |> response(:bad_request)

      expected_resposne = "{\"message\":\"Invalid UUID.\"}"

      assert response == expected_resposne
    end
  end
end
