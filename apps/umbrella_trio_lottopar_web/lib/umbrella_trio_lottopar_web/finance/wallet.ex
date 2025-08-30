defmodule UmbrellaTrioLottoparWeb.Finance.Wallet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wallets" do
    field :player_id, :string
    field :retail_id, :string
    field :wallet_type, :string
    field :currency_code, :string
    field :total_cash, :decimal
    field :total_bonus, :decimal

    timestamps()
  end

  @doc false
  def changeset(wallet, attrs) do
    wallet
    |> cast(attrs, [:player_id, :retail_id, :wallet_type, :currency_code, :total_cash, :total_bonus])
    |> validate_required([:player_id, :retail_id, :wallet_type, :currency_code, :total_cash, :total_bonus])
  end
end
