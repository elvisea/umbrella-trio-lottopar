defmodule UmbrellaTrioLottoparWeb.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmbrellaTrioLottoparWeb.Games` context.
  """

  @doc """
  Generate a wager.
  """
  def wager_fixture(attrs \\ %{}) do
    {:ok, wager} =
      attrs
      |> Enum.into(%{
        bonus_amount: "120.5",
        cash_amount: "120.5",
        codigo_lottopar: "some codigo_lottopar",
        event: %{},
        game_data: %{},
        game_id: "some game_id",
        game_name: "some game_name",
        game_type: "some game_type",
        op_id: "some op_id",
        player_id: "some player_id",
        process_charges: "some process_charges",
        ref_txn_id: "some ref_txn_id",
        retail_data: %{},
        sale_transaction_id: "some sale_transaction_id",
        service_charges: "some service_charges",
        tax_amount: "120.5",
        ticket_number: "some ticket_number",
        tp_txn_id: "some tp_txn_id",
        txn_amount: "120.5",
        txn_date: ~N[2025-08-31 20:16:00],
        txn_mode: "some txn_mode",
        txn_status: "some txn_status"
      })
      |> UmbrellaTrioLottoparWeb.Games.create_wager()

    wager
  end
end
