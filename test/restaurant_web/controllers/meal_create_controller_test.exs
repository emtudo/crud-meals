defmodule RestaurantWeb.MealCreateControllerTest do
  use RestaurantWeb.ConnCase, async: true

  import Restaurant.Factory

  describe "handle/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = build(:meal_params)

      response =
        conn
        |> post(Routes.meal_create_path(conn, :handle), params)
        |> json_response(:created)

      assert %{
               "message" => "Meal created!",
               "meal" => %{
                 "descricao" => "Arroz com Feijão",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns an error", %{conn: conn} do
      params = %{
        name: "Leandro"
      }

      response =
        conn
        |> post(Routes.meal_create_path(conn, :handle), params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "calorias" => ["can't be blank"],
          "data" => ["can't be blank"],
          "descricao" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end
end
