defmodule UmbrellaTrioLottoparWeb.FinanceTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Finance

  describe "wallets" do
    alias UmbrellaTrioLottoparWeb.Finance.Wallet

    import UmbrellaTrioLottoparWeb.FinanceFixtures

    @invalid_attrs %{
      player_id: nil,
      retail_id: nil,
      wallet_type: nil,
      currency_code: nil,
      total_cash: nil,
      total_bonus: nil
    }

    test "list_wallets/0 returns all wallets" do
      wallet = wallet_fixture()
      assert Finance.list_wallets() == [wallet]
    end

    test "get_wallet!/1 returns the wallet with given id" do
      wallet = wallet_fixture()
      assert Finance.get_wallet!(wallet.id) == wallet
    end

    test "create_wallet/1 with valid data creates a wallet" do
      valid_attrs = %{
        player_id: "some player_id",
        retail_id: "some retail_id",
        wallet_type: "some wallet_type",
        currency_code: "some currency_code",
        total_cash: "120.5",
        total_bonus: "120.5"
      }

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

      update_attrs = %{
        player_id: "some updated player_id",
        retail_id: "some updated retail_id",
        wallet_type: "some updated wallet_type",
        currency_code: "some updated currency_code",
        total_cash: "456.7",
        total_bonus: "456.7"
      }

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

  describe "deposits" do
    alias UmbrellaTrioLottoparWeb.Finance.Deposit

    import UmbrellaTrioLottoparWeb.FinanceFixtures

    @invalid_attrs %{
      player_id: nil,
      op_id: nil,
      txn_amount: nil,
      tax_amount: nil,
      wallet_affected_amount: nil,
      txn_status: nil,
      txn_date: nil,
      txn_mode: nil,
      process_charges: nil,
      codigo_lottopar: nil,
      ref_txn_id: nil,
      payment_type: nil,
      sub_payment_type: nil,
      service_charges: nil,
      tp_txn_id: nil,
      retail_data: nil
    }

    test "list_deposits/0 returns all deposits" do
      deposit = deposit_fixture()
      assert Finance.list_deposits() == [deposit]
    end

    test "get_deposit!/1 returns the deposit with given id" do
      deposit = deposit_fixture()
      assert Finance.get_deposit!(deposit.id) == deposit
    end

    test "create_deposit/1 with valid data creates a deposit" do
      valid_attrs = %{
        player_id: "some player_id",
        op_id: "some op_id",
        txn_amount: "120.5",
        tax_amount: "120.5",
        wallet_affected_amount: "120.5",
        txn_status: "some txn_status",
        txn_date: ~N[2025-08-31 13:55:00],
        txn_mode: "some txn_mode",
        process_charges: "some process_charges",
        codigo_lottopar: "some codigo_lottopar",
        ref_txn_id: "some ref_txn_id",
        payment_type: "some payment_type",
        sub_payment_type: "some sub_payment_type",
        service_charges: "some service_charges",
        tp_txn_id: "some tp_txn_id",
        retail_data: %{}
      }

      assert {:ok, %Deposit{} = deposit} = Finance.create_deposit(valid_attrs)
      assert deposit.player_id == "some player_id"
      assert deposit.op_id == "some op_id"
      assert deposit.txn_amount == Decimal.new("120.5")
      assert deposit.tax_amount == Decimal.new("120.5")
      assert deposit.wallet_affected_amount == Decimal.new("120.5")
      assert deposit.txn_status == "some txn_status"
      assert deposit.txn_date == ~N[2025-08-31 13:55:00]
      assert deposit.txn_mode == "some txn_mode"
      assert deposit.process_charges == "some process_charges"
      assert deposit.codigo_lottopar == "some codigo_lottopar"
      assert deposit.ref_txn_id == "some ref_txn_id"
      assert deposit.payment_type == "some payment_type"
      assert deposit.sub_payment_type == "some sub_payment_type"
      assert deposit.service_charges == "some service_charges"
      assert deposit.tp_txn_id == "some tp_txn_id"
      assert deposit.retail_data == %{}
    end

    test "create_deposit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_deposit(@invalid_attrs)
    end

    test "update_deposit/2 with valid data updates the deposit" do
      deposit = deposit_fixture()

      update_attrs = %{
        player_id: "some updated player_id",
        op_id: "some updated op_id",
        txn_amount: "456.7",
        tax_amount: "456.7",
        wallet_affected_amount: "456.7",
        txn_status: "some updated txn_status",
        txn_date: ~N[2025-09-01 13:55:00],
        txn_mode: "some updated txn_mode",
        process_charges: "some updated process_charges",
        codigo_lottopar: "some updated codigo_lottopar",
        ref_txn_id: "some updated ref_txn_id",
        payment_type: "some updated payment_type",
        sub_payment_type: "some updated sub_payment_type",
        service_charges: "some updated service_charges",
        tp_txn_id: "some updated tp_txn_id",
        retail_data: %{}
      }

      assert {:ok, %Deposit{} = deposit} = Finance.update_deposit(deposit, update_attrs)
      assert deposit.player_id == "some updated player_id"
      assert deposit.op_id == "some updated op_id"
      assert deposit.txn_amount == Decimal.new("456.7")
      assert deposit.tax_amount == Decimal.new("456.7")
      assert deposit.wallet_affected_amount == Decimal.new("456.7")
      assert deposit.txn_status == "some updated txn_status"
      assert deposit.txn_date == ~N[2025-09-01 13:55:00]
      assert deposit.txn_mode == "some updated txn_mode"
      assert deposit.process_charges == "some updated process_charges"
      assert deposit.codigo_lottopar == "some updated codigo_lottopar"
      assert deposit.ref_txn_id == "some updated ref_txn_id"
      assert deposit.payment_type == "some updated payment_type"
      assert deposit.sub_payment_type == "some updated sub_payment_type"
      assert deposit.service_charges == "some updated service_charges"
      assert deposit.tp_txn_id == "some updated tp_txn_id"
      assert deposit.retail_data == %{}
    end

    test "update_deposit/2 with invalid data returns error changeset" do
      deposit = deposit_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_deposit(deposit, @invalid_attrs)
      assert deposit == Finance.get_deposit!(deposit.id)
    end

    test "delete_deposit/1 deletes the deposit" do
      deposit = deposit_fixture()
      assert {:ok, %Deposit{}} = Finance.delete_deposit(deposit)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_deposit!(deposit.id) end
    end

    test "change_deposit/1 returns a deposit changeset" do
      deposit = deposit_fixture()
      assert %Ecto.Changeset{} = Finance.change_deposit(deposit)
    end
  end

  describe "withdraws" do
    alias UmbrellaTrioLottoparWeb.Finance.Withdraw

    import UmbrellaTrioLottoparWeb.FinanceFixtures

    @invalid_attrs %{
      player_id: nil,
      op_id: nil,
      txn_amount: nil,
      tax_amount: nil,
      wallet_affected_amount: nil,
      txn_status: nil,
      txn_date: nil,
      txn_mode: nil,
      process_charges: nil,
      codigo_lottopar: nil,
      ref_txn_id: nil,
      service_charges: nil,
      tp_txn_id: nil,
      account: nil,
      confirmation_date: nil,
      currency_code: nil,
      retail_data: nil
    }

    test "list_withdraws/0 returns all withdraws" do
      withdraw = withdraw_fixture()
      assert Finance.list_withdraws() == [withdraw]
    end

    test "get_withdraw!/1 returns the withdraw with given id" do
      withdraw = withdraw_fixture()
      assert Finance.get_withdraw!(withdraw.id) == withdraw
    end

    test "create_withdraw/1 with valid data creates a withdraw" do
      valid_attrs = %{
        player_id: "some player_id",
        op_id: "some op_id",
        txn_amount: "120.5",
        tax_amount: "120.5",
        wallet_affected_amount: "120.5",
        txn_status: "some txn_status",
        txn_date: ~N[2025-08-31 14:34:00],
        txn_mode: "some txn_mode",
        process_charges: "some process_charges",
        codigo_lottopar: "some codigo_lottopar",
        ref_txn_id: "some ref_txn_id",
        service_charges: "some service_charges",
        tp_txn_id: "some tp_txn_id",
        account: "some account",
        confirmation_date: ~N[2025-08-31 14:34:00],
        currency_code: "some currency_code",
        retail_data: %{}
      }

      assert {:ok, %Withdraw{} = withdraw} = Finance.create_withdraw(valid_attrs)
      assert withdraw.player_id == "some player_id"
      assert withdraw.op_id == "some op_id"
      assert withdraw.txn_amount == Decimal.new("120.5")
      assert withdraw.tax_amount == Decimal.new("120.5")
      assert withdraw.wallet_affected_amount == Decimal.new("120.5")
      assert withdraw.txn_status == "some txn_status"
      assert withdraw.txn_date == ~N[2025-08-31 14:34:00]
      assert withdraw.txn_mode == "some txn_mode"
      assert withdraw.process_charges == "some process_charges"
      assert withdraw.codigo_lottopar == "some codigo_lottopar"
      assert withdraw.ref_txn_id == "some ref_txn_id"
      assert withdraw.service_charges == "some service_charges"
      assert withdraw.tp_txn_id == "some tp_txn_id"
      assert withdraw.account == "some account"
      assert withdraw.confirmation_date == ~N[2025-08-31 14:34:00]
      assert withdraw.currency_code == "some currency_code"
      assert withdraw.retail_data == %{}
    end

    test "create_withdraw/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_withdraw(@invalid_attrs)
    end

    test "update_withdraw/2 with valid data updates the withdraw" do
      withdraw = withdraw_fixture()

      update_attrs = %{
        player_id: "some updated player_id",
        op_id: "some updated op_id",
        txn_amount: "456.7",
        tax_amount: "456.7",
        wallet_affected_amount: "456.7",
        txn_status: "some updated txn_status",
        txn_date: ~N[2025-09-01 14:34:00],
        txn_mode: "some updated txn_mode",
        process_charges: "some updated process_charges",
        codigo_lottopar: "some updated codigo_lottopar",
        ref_txn_id: "some updated ref_txn_id",
        service_charges: "some updated service_charges",
        tp_txn_id: "some updated tp_txn_id",
        account: "some updated account",
        confirmation_date: ~N[2025-09-01 14:34:00],
        currency_code: "some updated currency_code",
        retail_data: %{}
      }

      assert {:ok, %Withdraw{} = withdraw} = Finance.update_withdraw(withdraw, update_attrs)
      assert withdraw.player_id == "some updated player_id"
      assert withdraw.op_id == "some updated op_id"
      assert withdraw.txn_amount == Decimal.new("456.7")
      assert withdraw.tax_amount == Decimal.new("456.7")
      assert withdraw.wallet_affected_amount == Decimal.new("456.7")
      assert withdraw.txn_status == "some updated txn_status"
      assert withdraw.txn_date == ~N[2025-09-01 14:34:00]
      assert withdraw.txn_mode == "some updated txn_mode"
      assert withdraw.process_charges == "some updated process_charges"
      assert withdraw.codigo_lottopar == "some updated codigo_lottopar"
      assert withdraw.ref_txn_id == "some updated ref_txn_id"
      assert withdraw.service_charges == "some updated service_charges"
      assert withdraw.tp_txn_id == "some updated tp_txn_id"
      assert withdraw.account == "some updated account"
      assert withdraw.confirmation_date == ~N[2025-09-01 14:34:00]
      assert withdraw.currency_code == "some updated currency_code"
      assert withdraw.retail_data == %{}
    end

    test "update_withdraw/2 with invalid data returns error changeset" do
      withdraw = withdraw_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_withdraw(withdraw, @invalid_attrs)
      assert withdraw == Finance.get_withdraw!(withdraw.id)
    end

    test "delete_withdraw/1 deletes the withdraw" do
      withdraw = withdraw_fixture()
      assert {:ok, %Withdraw{}} = Finance.delete_withdraw(withdraw)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_withdraw!(withdraw.id) end
    end

    test "change_withdraw/1 returns a withdraw changeset" do
      withdraw = withdraw_fixture()
      assert %Ecto.Changeset{} = Finance.change_withdraw(withdraw)
    end
  end
end
