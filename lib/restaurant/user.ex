defmodule Restaurant.User do
  alias Restaurant.Meal
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:nome, :cpf, :email]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :nome, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def build(changeset, action \\ :create), do: apply_action(changeset, action)

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint(:cpf)
    |> unique_constraint(:email)
  end
end
