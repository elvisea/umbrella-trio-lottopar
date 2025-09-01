defmodule Core.Finance.Wallet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wallets" do
    field(:wallet_type, :string)
    field(:currency_code, :string)
    field(:total_cash, :decimal)
    field(:total_bonus, :decimal)

    # Relacionamentos
    belongs_to(:player, Core.Players.Player)
    belongs_to(:retail, Core.Retail.Retail)

    timestamps()
  end

  @doc false
  def changeset(wallet, attrs) do
    wallet
    |> cast(attrs, [
      :player_id,
      :retail_id,
      :wallet_type,
      :currency_code,
      :total_cash,
      :total_bonus
    ])
    |> validate_required([
      :player_id,
      :retail_id,
      :wallet_type,
      :currency_code,
      :total_cash,
      :total_bonus
    ])
  end
end
