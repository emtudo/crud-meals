defmodule RestaurantWeb.MealUpdateControllerTest do
  use RestaurantWeb.ConnCase, async: true

  import Restaurant.Factory

  describe "handle/2" do
    test "when there is a meal with the given id, shows the meal", %{conn: conn} do
      params = build(:meal_params)
      {:ok, meal} = Restaurant.create_meal(params)

      params = build(:meal_params, descricao: "Nada com nada")

      response =
        conn
        |> put(Routes.meal_update_path(conn, :handle, meal.id, params))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "descricao" => "Nada com nada",
                 "id" => _id
               }
             } = response
    end

    test "when there isnt meal with the given id, returns error", %{conn: conn} do
      new = build(:meal_params, descricao: "Nada com nada")

      response =
        conn
        |> put(
          Routes.meal_update_path(conn, :handle, "583143ce-99a2-4c36-a188-5b4c832e6ba3", new)
        )
        |> response(:not_found)

      expected_resposne = "{\"message\":\"Meal not found.\"}"

      assert response == expected_resposne
    end

    test "when invalid params, returns an error", %{conn: conn} do
      params = build(:meal_params)
      {:ok, meal} = Restaurant.create_meal(params)

      new = build(:meal_params, descricao: "Nada", calorias: "teste")

      response =
        conn
        |> put(Routes.meal_update_path(conn, :handle, meal.id, new))
        |> response(:bad_request)

      expected_resposne =
        "{\"errors\":{\"calorias\":[\"is invalid\"],\"descricao\":[\"should be at least 10 character(s)\"]}}"

      assert response == expected_resposne
    end

    test "when id is invalid, returns error", %{conn: conn} do
      new = build(:meal_params, descricao: "Nada com nada")

      response =
        conn
        |> put(Routes.meal_update_path(conn, :handle, "783143ce", new))
        |> response(:bad_request)

      expected_resposne = "{\"message\":\"Invalid UUID.\"}"

      assert response == expected_resposne
    end
  end
end
