defmodule RestaurantWeb.Router do
  use RestaurantWeb, :router
  alias RestaurantWeb.Plugs.{UserIdChecker, UUIDChecker}

  pipeline :user_id do
    plug UserIdChecker
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RestaurantWeb do
    pipe_through :api

    post "/users", UserCreateController, :handle
    get "/users/:id", UserShowController, :handle
    get "/users/:id/meals", UserMealsController, :handle
    delete "/users/:id", UserDeleteController, :handle
    put "/users/:id", UserUpdateController, :handle

    pipe_through :user_id
    post "/meals", MealCreateController, :handle
    get "/meals/:id", MealShowController, :handle
    delete "/meals/:id", MealDeleteController, :handle
    put "/meals/:id", MealUpdateController, :handle
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RestaurantWeb.Telemetry
    end
  end
end
