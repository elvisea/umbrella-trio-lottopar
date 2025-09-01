defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateDeposits do
  use Ecto.Migration

  def change do
    create table(:deposits) do
      add :player_id, :string
      add :op_id, :string
      add :txn_amount, :decimal
      add :tax_amount, :decimal
      add :wallet_affected_amount, :decimal
      add :txn_status, :string
      add :txn_date, :naive_datetime
      add :txn_mode, :string
      add :process_charges, :string
      add :codigo_lottopar, :string
      add :ref_txn_id, :string
      add :payment_type, :string
      add :sub_payment_type, :string
      add :service_charges, :string
      add :tp_txn_id, :string
      add :retail_data, :map

      timestamps()
    end
  end
end
