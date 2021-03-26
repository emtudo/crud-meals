defmodule Restaurant.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:descricao, :data, :calorias]

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias]}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:descricao, min: 10, max: 255)
    |> validate_number(:calorias, greater_than_or_equal_to: 0)
  end
end
