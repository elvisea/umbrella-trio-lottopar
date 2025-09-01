defmodule UmbrellaTrioLottoparWeb.FinanceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmbrellaTrioLottoparWeb.Finance` context.
  """

  @doc """
  Generate a wallet.
  """
  def wallet_fixture(attrs \\ %{}) do
    {:ok, wallet} =
      attrs
      |> Enum.into(%{
        currency_code: "some currency_code",
        player_id: "some player_id",
        retail_id: "some retail_id",
        total_bonus: "120.5",
        total_cash: "120.5",
        wallet_type: "some wallet_type"
      })
      |> UmbrellaTrioLottoparWeb.Finance.create_wallet()

    wallet
  end

  @doc """
  Generate a deposit.
  """
  def deposit_fixture(attrs \\ %{}) do
    {:ok, deposit} =
      attrs
      |> Enum.into(%{
        codigo_lottopar: "some codigo_lottopar",
        op_id: "some op_id",
        payment_type: "some payment_type",
        player_id: "some player_id",
        process_charges: "some process_charges",
        ref_txn_id: "some ref_txn_id",
        retail_data: %{},
        service_charges: "some service_charges",
        sub_payment_type: "some sub_payment_type",
        tax_amount: "120.5",
        tp_txn_id: "some tp_txn_id",
        txn_amount: "120.5",
        txn_date: ~N[2025-08-31 13:55:00],
        txn_mode: "some txn_mode",
        txn_status: "some txn_status",
        wallet_affected_amount: "120.5"
      })
      |> UmbrellaTrioLottoparWeb.Finance.create_deposit()

    deposit
  end
end
