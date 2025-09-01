defmodule Core.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field(:username, :string)
    field(:password, :string)
    field(:status, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:document, :string)
    field(:birth_date, :date)
    field(:phone, :string)
    field(:email, :string)
    field(:gender, :string)
    field(:address, :string)
    field(:city, :string)
    field(:state, :string)
    field(:country, :string)
    field(:zip_code, :string)
    field(:registration_date, :date)
    field(:last_login, :naive_datetime)

    # Relacionamentos
    belongs_to(:operator, Core.Admin.Operator)
    has_many(:deposits, Core.Finance.Deposit)
    has_many(:withdraws, Core.Finance.Withdraw)
    has_one(:wallet, Core.Finance.Wallet)

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [
      :operator_id,
      :username,
      :password,
      :status,
      :first_name,
      :last_name,
      :document,
      :birth_date,
      :phone,
      :email,
      :gender,
      :address,
      :city,
      :state,
      :country,
      :zip_code,
      :registration_date,
      :last_login
    ])
    |> validate_required([
      :operator_id,
      :username,
      :password,
      :status,
      :first_name,
      :last_name,
      :document,
      :birth_date,
      :phone,
      :email,
      :gender,
      :address,
      :city,
      :state,
      :country,
      :zip_code,
      :registration_date,
      :last_login
    ])
  end
end
