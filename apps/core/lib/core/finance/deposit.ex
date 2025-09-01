defmodule Core.Finance.Deposit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "deposits" do
    field(:txn_amount, :decimal)
    field(:tax_amount, :decimal)
    field(:wallet_affected_amount, :decimal)
    field(:txn_status, :string)
    field(:txn_date, :naive_datetime)
    field(:txn_mode, :string)
    field(:process_charges, :string)
    field(:codigo_lottopar, :string)
    field(:ref_txn_id, :string)
    field(:payment_type, :string)
    field(:sub_payment_type, :string)
    field(:service_charges, :string)
    field(:tp_txn_id, :string)
    field(:retail_data, :map)

    # Relacionamentos
    belongs_to(:player, Core.Players.Player)
    belongs_to(:operator, Core.Admin.Operator)

    timestamps()
  end

  @doc false
  def changeset(deposit, attrs) do
    deposit
    |> cast(attrs, [
      :player_id,
      :operator_id,
      :txn_amount,
      :tax_amount,
      :wallet_affected_amount,
      :txn_status,
      :txn_date,
      :txn_mode,
      :process_charges,
      :codigo_lottopar,
      :ref_txn_id,
      :payment_type,
      :sub_payment_type,
      :service_charges,
      :tp_txn_id,
      :retail_data
    ])
    |> validate_required([
      :player_id,
      :operator_id,
      :txn_amount,
      :tax_amount,
      :wallet_affected_amount,
      :txn_status,
      :txn_date,
      :txn_mode,
      :process_charges,
      :codigo_lottopar,
      :ref_txn_id,
      :payment_type,
      :sub_payment_type,
      :service_charges,
      :tp_txn_id
    ])
  end
end
