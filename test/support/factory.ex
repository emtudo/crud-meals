defmodule Restaurant.Factory do
  use ExMachina.Ecto, repo: Restaurant.Repo
  alias Restaurant.Meal

  def meal_params_factory do
    %{
      descricao: "Arroz com Feijão",
      data: "2021-03-25T18:00:00",
      calorias: 20
    }
  end

  def meal_factory do
    %Meal{
      id: "183143ce-99a2-4c36-a188-5b4c832e6ba3",
      descricao: "Arroz com Feijão",
      data: "2021-03-25T18:00:00",
      calorias: 20
    }
  end
end
