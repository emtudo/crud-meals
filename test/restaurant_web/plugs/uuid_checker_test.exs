defmodule RestaurantWeb.Plugs.UUIDCheckerTest do
  use RestaurantWeb.ConnCase
  alias RestaurantWeb.Plugs.UUIDChecker

  test "test init with options" do
    response = UUIDChecker.init(%{})

    assert response == %{}
  end
end
