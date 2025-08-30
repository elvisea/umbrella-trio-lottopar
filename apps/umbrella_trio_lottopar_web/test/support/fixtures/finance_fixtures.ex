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
end
