defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateWallets do
  use Ecto.Migration

  def change do
    create table(:wallets) do
      add :player_id, :string
      add :retail_id, :string
      add :wallet_type, :string
      add :currency_code, :string
      add :total_cash, :decimal
      add :total_bonus, :decimal

      timestamps()
    end
  end
end
