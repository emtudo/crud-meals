defmodule Restaurant.Meal do
  alias Restaurant.User
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:descricao, :data, :calorias, :user_id]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @required_params)
    |> foreign_key_constraint(:user_id)
    |> validate_required(@required_params)
    |> validate_length(:descricao, min: 10, max: 255)
    |> validate_number(:calorias, greater_than_or_equal_to: 0)
  end
end
