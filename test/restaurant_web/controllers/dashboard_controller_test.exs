defmodule RestaurantWeb.DashboardControllerTest do
  use RestaurantWeb.ConnCase, async: true

  describe "handle/2" do
    test "verify has dashboard", %{conn: conn} do
      response =
        conn
        |> get(Routes.live_dashboard_path(conn, :home))
        |> response(:found)

      expected_resposne =
        "<html><body>You are being <a href=\"/dashboard/home\">redirected</a>.</body></html>"

      assert response == expected_resposne
    end
  end
end
