defmodule UmbrellaTrioLottoparWeb.FinanceTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Finance

  describe "wallets" do
    alias UmbrellaTrioLottoparWeb.Finance.Wallet

    import UmbrellaTrioLottoparWeb.FinanceFixtures

    @invalid_attrs %{player_id: nil, retail_id: nil, wallet_type: nil, currency_code: nil, total_cash: nil, total_bonus: nil}

    test "list_wallets/0 returns all wallets" do
      wallet = wallet_fixture()
      assert Finance.list_wallets() == [wallet]
    end

    test "get_wallet!/1 returns the wallet with given id" do
      wallet = wallet_fixture()
      assert Finance.get_wallet!(wallet.id) == wallet
    end

    test "create_wallet/1 with valid data creates a wallet" do
      valid_attrs = %{player_id: "some player_id", retail_id: "some retail_id", wallet_type: "some wallet_type", currency_code: "some currency_code", total_cash: "120.5", total_bonus: "120.5"}

      assert {:ok, %Wallet{} = wallet} = Finance.create_wallet(valid_attrs)
      assert wallet.player_id == "some player_id"
      assert wallet.retail_id == "some retail_id"
      assert wallet.wallet_type == "some wallet_type"
      assert wallet.currency_code == "some currency_code"
      assert wallet.total_cash == Decimal.new("120.5")
      assert wallet.total_bonus == Decimal.new("120.5")
    end

    test "create_wallet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_wallet(@invalid_attrs)
    end

    test "update_wallet/2 with valid data updates the wallet" do
      wallet = wallet_fixture()
      update_attrs = %{player_id: "some updated player_id", retail_id: "some updated retail_id", wallet_type: "some updated wallet_type", currency_code: "some updated currency_code", total_cash: "456.7", total_bonus: "456.7"}

      assert {:ok, %Wallet{} = wallet} = Finance.update_wallet(wallet, update_attrs)
      assert wallet.player_id == "some updated player_id"
      assert wallet.retail_id == "some updated retail_id"
      assert wallet.wallet_type == "some updated wallet_type"
      assert wallet.currency_code == "some updated currency_code"
      assert wallet.total_cash == Decimal.new("456.7")
      assert wallet.total_bonus == Decimal.new("456.7")
    end

    test "update_wallet/2 with invalid data returns error changeset" do
      wallet = wallet_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_wallet(wallet, @invalid_attrs)
      assert wallet == Finance.get_wallet!(wallet.id)
    end

    test "delete_wallet/1 deletes the wallet" do
      wallet = wallet_fixture()
      assert {:ok, %Wallet{}} = Finance.delete_wallet(wallet)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_wallet!(wallet.id) end
    end

    test "change_wallet/1 returns a wallet changeset" do
      wallet = wallet_fixture()
      assert %Ecto.Changeset{} = Finance.change_wallet(wallet)
    end
  end
end
