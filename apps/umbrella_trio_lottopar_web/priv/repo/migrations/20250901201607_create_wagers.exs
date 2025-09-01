defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateWagers do
  use Ecto.Migration

  def change do
    create table(:wagers) do
      add :player_id, :string
      add :op_id, :string
      add :txn_amount, :decimal
      add :bonus_amount, :decimal
      add :cash_amount, :decimal
      add :tax_amount, :decimal
      add :txn_status, :string
      add :txn_date, :naive_datetime
      add :txn_mode, :string
      add :process_charges, :string
      add :codigo_lottopar, :string
      add :ref_txn_id, :string
      add :service_charges, :string
      add :tp_txn_id, :string
      add :sale_transaction_id, :string
      add :ticket_number, :string
      add :game_id, :string
      add :game_type, :string
      add :game_name, :string
      add :game_data, :map
      add :event, :map
      add :retail_data, :map

      timestamps()
    end
  end
end
