defmodule Core.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:user_type, :string)
    field(:status, :string)
    field(:username, :string)
    field(:password, :string)
    field(:otp, :string)

    # Relacionamentos
    belongs_to(:operator, Core.Admin.Operator)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :operator_id,
      :user_type,
      :status,
      :username,
      :password,
      :otp
    ])
    |> validate_required([
      :operator_id,
      :user_type,
      :status,
      :username,
      :password,
      :otp
    ])
  end
end
