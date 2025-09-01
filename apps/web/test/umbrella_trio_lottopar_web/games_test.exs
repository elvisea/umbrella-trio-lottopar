defmodule UmbrellaTrioLottoparWeb.GamesTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Games

  describe "wagers" do
    alias UmbrellaTrioLottoparWeb.Games.Wager

    import UmbrellaTrioLottoparWeb.GamesFixtures

    @invalid_attrs %{player_id: nil, op_id: nil, txn_amount: nil, bonus_amount: nil, cash_amount: nil, tax_amount: nil, txn_status: nil, txn_date: nil, txn_mode: nil, process_charges: nil, codigo_lottopar: nil, ref_txn_id: nil, service_charges: nil, tp_txn_id: nil, sale_transaction_id: nil, ticket_number: nil, game_id: nil, game_type: nil, game_name: nil, game_data: nil, event: nil, retail_data: nil}

    test "list_wagers/0 returns all wagers" do
      wager = wager_fixture()
      assert Games.list_wagers() == [wager]
    end

    test "get_wager!/1 returns the wager with given id" do
      wager = wager_fixture()
      assert Games.get_wager!(wager.id) == wager
    end

    test "create_wager/1 with valid data creates a wager" do
      valid_attrs = %{player_id: "some player_id", op_id: "some op_id", txn_amount: "120.5", bonus_amount: "120.5", cash_amount: "120.5", tax_amount: "120.5", txn_status: "some txn_status", txn_date: ~N[2025-08-31 20:16:00], txn_mode: "some txn_mode", process_charges: "some process_charges", codigo_lottopar: "some codigo_lottopar", ref_txn_id: "some ref_txn_id", service_charges: "some service_charges", tp_txn_id: "some tp_txn_id", sale_transaction_id: "some sale_transaction_id", ticket_number: "some ticket_number", game_id: "some game_id", game_type: "some game_type", game_name: "some game_name", game_data: %{}, event: %{}, retail_data: %{}}

      assert {:ok, %Wager{} = wager} = Games.create_wager(valid_attrs)
      assert wager.player_id == "some player_id"
      assert wager.op_id == "some op_id"
      assert wager.txn_amount == Decimal.new("120.5")
      assert wager.bonus_amount == Decimal.new("120.5")
      assert wager.cash_amount == Decimal.new("120.5")
      assert wager.tax_amount == Decimal.new("120.5")
      assert wager.txn_status == "some txn_status"
      assert wager.txn_date == ~N[2025-08-31 20:16:00]
      assert wager.txn_mode == "some txn_mode"
      assert wager.process_charges == "some process_charges"
      assert wager.codigo_lottopar == "some codigo_lottopar"
      assert wager.ref_txn_id == "some ref_txn_id"
      assert wager.service_charges == "some service_charges"
      assert wager.tp_txn_id == "some tp_txn_id"
      assert wager.sale_transaction_id == "some sale_transaction_id"
      assert wager.ticket_number == "some ticket_number"
      assert wager.game_id == "some game_id"
      assert wager.game_type == "some game_type"
      assert wager.game_name == "some game_name"
      assert wager.game_data == %{}
      assert wager.event == %{}
      assert wager.retail_data == %{}
    end

    test "create_wager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_wager(@invalid_attrs)
    end

    test "update_wager/2 with valid data updates the wager" do
      wager = wager_fixture()
      update_attrs = %{player_id: "some updated player_id", op_id: "some updated op_id", txn_amount: "456.7", bonus_amount: "456.7", cash_amount: "456.7", tax_amount: "456.7", txn_status: "some updated txn_status", txn_date: ~N[2025-09-01 20:16:00], txn_mode: "some updated txn_mode", process_charges: "some updated process_charges", codigo_lottopar: "some updated codigo_lottopar", ref_txn_id: "some updated ref_txn_id", service_charges: "some updated service_charges", tp_txn_id: "some updated tp_txn_id", sale_transaction_id: "some updated sale_transaction_id", ticket_number: "some updated ticket_number", game_id: "some updated game_id", game_type: "some updated game_type", game_name: "some updated game_name", game_data: %{}, event: %{}, retail_data: %{}}

      assert {:ok, %Wager{} = wager} = Games.update_wager(wager, update_attrs)
      assert wager.player_id == "some updated player_id"
      assert wager.op_id == "some updated op_id"
      assert wager.txn_amount == Decimal.new("456.7")
      assert wager.bonus_amount == Decimal.new("456.7")
      assert wager.cash_amount == Decimal.new("456.7")
      assert wager.tax_amount == Decimal.new("456.7")
      assert wager.txn_status == "some updated txn_status"
      assert wager.txn_date == ~N[2025-09-01 20:16:00]
      assert wager.txn_mode == "some updated txn_mode"
      assert wager.process_charges == "some updated process_charges"
      assert wager.codigo_lottopar == "some updated codigo_lottopar"
      assert wager.ref_txn_id == "some updated ref_txn_id"
      assert wager.service_charges == "some updated service_charges"
      assert wager.tp_txn_id == "some updated tp_txn_id"
      assert wager.sale_transaction_id == "some updated sale_transaction_id"
      assert wager.ticket_number == "some updated ticket_number"
      assert wager.game_id == "some updated game_id"
      assert wager.game_type == "some updated game_type"
      assert wager.game_name == "some updated game_name"
      assert wager.game_data == %{}
      assert wager.event == %{}
      assert wager.retail_data == %{}
    end

    test "update_wager/2 with invalid data returns error changeset" do
      wager = wager_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_wager(wager, @invalid_attrs)
      assert wager == Games.get_wager!(wager.id)
    end

    test "delete_wager/1 deletes the wager" do
      wager = wager_fixture()
      assert {:ok, %Wager{}} = Games.delete_wager(wager)
      assert_raise Ecto.NoResultsError, fn -> Games.get_wager!(wager.id) end
    end

    test "change_wager/1 returns a wager changeset" do
      wager = wager_fixture()
      assert %Ecto.Changeset{} = Games.change_wager(wager)
    end
  end
end
