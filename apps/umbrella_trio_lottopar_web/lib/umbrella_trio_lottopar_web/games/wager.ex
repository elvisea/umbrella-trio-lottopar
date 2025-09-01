defmodule UmbrellaTrioLottoparWeb.Games.Wager do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wagers" do
    field :player_id, :string
    field :op_id, :string
    field :txn_amount, :decimal
    field :bonus_amount, :decimal
    field :cash_amount, :decimal
    field :tax_amount, :decimal
    field :txn_status, :string
    field :txn_date, :naive_datetime
    field :txn_mode, :string
    field :process_charges, :string
    field :codigo_lottopar, :string
    field :ref_txn_id, :string
    field :service_charges, :string
    field :tp_txn_id, :string
    field :sale_transaction_id, :string
    field :ticket_number, :string
    field :game_id, :string
    field :game_type, :string
    field :game_name, :string
    field :game_data, :map
    field :event, :map
    field :retail_data, :map

    timestamps()
  end

  @doc false
  def changeset(wager, attrs) do
    wager
    |> cast(attrs, [:player_id, :op_id, :txn_amount, :bonus_amount, :cash_amount, :tax_amount, :txn_status, :txn_date, :txn_mode, :process_charges, :codigo_lottopar, :ref_txn_id, :service_charges, :tp_txn_id, :sale_transaction_id, :ticket_number, :game_id, :game_type, :game_name, :game_data, :event, :retail_data])
    |> validate_required([:player_id, :op_id, :txn_amount, :bonus_amount, :cash_amount, :tax_amount, :txn_status, :txn_date, :txn_mode, :process_charges, :codigo_lottopar, :ref_txn_id, :service_charges, :tp_txn_id, :sale_transaction_id, :ticket_number, :game_id, :game_type, :game_name])
  end
end
