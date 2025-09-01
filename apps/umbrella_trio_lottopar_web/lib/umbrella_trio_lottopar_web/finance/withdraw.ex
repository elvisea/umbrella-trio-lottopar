defmodule UmbrellaTrioLottoparWeb.Finance.Withdraw do
  use Ecto.Schema
  import Ecto.Changeset

  schema "withdraws" do
    field :player_id, :string
    field :op_id, :string
    field :txn_amount, :decimal
    field :tax_amount, :decimal
    field :wallet_affected_amount, :decimal
    field :txn_status, :string
    field :txn_date, :naive_datetime
    field :txn_mode, :string
    field :process_charges, :string
    field :codigo_lottopar, :string
    field :ref_txn_id, :string
    field :service_charges, :string
    field :tp_txn_id, :string
    field :account, :string
    field :confirmation_date, :naive_datetime
    field :currency_code, :string
    field :retail_data, :map

    timestamps()
  end

  @doc false
  def changeset(withdraw, attrs) do
    withdraw
    |> cast(attrs, [:player_id, :op_id, :txn_amount, :tax_amount, :wallet_affected_amount, :txn_status, :txn_date, :txn_mode, :process_charges, :codigo_lottopar, :ref_txn_id, :service_charges, :tp_txn_id, :account, :confirmation_date, :currency_code, :retail_data])
    |> validate_required([:player_id, :op_id, :txn_amount, :tax_amount, :wallet_affected_amount, :txn_status, :txn_date, :txn_mode, :process_charges, :codigo_lottopar, :ref_txn_id, :service_charges, :tp_txn_id, :account, :confirmation_date, :currency_code])
  end
end
