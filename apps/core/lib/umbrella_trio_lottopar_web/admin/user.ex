defmodule UmbrellaTrioLottoparWeb.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :op_id, :string
    field :user_type, :string
    field :status, :string
    field :username, :string
    field :password, :string
    field :otp, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:op_id, :user_type, :status, :username, :password, :otp])
    |> validate_required([:op_id, :user_type, :status, :username, :password, :otp])
  end
end
