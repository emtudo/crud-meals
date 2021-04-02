defmodule RestaurantWeb.UserView do
  use RestaurantWeb, :view
  alias Restaurant.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
  def render("user_meals.json", %{user: %User{} = user}), do: %{user: user, meals: user.meals}
end
