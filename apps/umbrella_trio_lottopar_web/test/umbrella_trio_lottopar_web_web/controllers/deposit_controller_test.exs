defmodule UmbrellaTrioLottoparWeb.DepositControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.FinanceFixtures

  @create_attrs %{player_id: "some player_id", op_id: "some op_id", txn_amount: "120.5", tax_amount: "120.5", wallet_affected_amount: "120.5", txn_status: "some txn_status", txn_date: ~N[2025-08-31 13:55:00], txn_mode: "some txn_mode", process_charges: "some process_charges", codigo_lottopar: "some codigo_lottopar", ref_txn_id: "some ref_txn_id", payment_type: "some payment_type", sub_payment_type: "some sub_payment_type", service_charges: "some service_charges", tp_txn_id: "some tp_txn_id", retail_data: %{}}
  @update_attrs %{player_id: "some updated player_id", op_id: "some updated op_id", txn_amount: "456.7", tax_amount: "456.7", wallet_affected_amount: "456.7", txn_status: "some updated txn_status", txn_date: ~N[2025-09-01 13:55:00], txn_mode: "some updated txn_mode", process_charges: "some updated process_charges", codigo_lottopar: "some updated codigo_lottopar", ref_txn_id: "some updated ref_txn_id", payment_type: "some updated payment_type", sub_payment_type: "some updated sub_payment_type", service_charges: "some updated service_charges", tp_txn_id: "some updated tp_txn_id", retail_data: %{}}
  @invalid_attrs %{player_id: nil, op_id: nil, txn_amount: nil, tax_amount: nil, wallet_affected_amount: nil, txn_status: nil, txn_date: nil, txn_mode: nil, process_charges: nil, codigo_lottopar: nil, ref_txn_id: nil, payment_type: nil, sub_payment_type: nil, service_charges: nil, tp_txn_id: nil, retail_data: nil}

  describe "index" do
    test "lists all deposits", %{conn: conn} do
      conn = get(conn, ~p"/deposits")
      assert html_response(conn, 200) =~ "Listing Deposits"
    end
  end

  describe "new deposit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/deposits/new")
      assert html_response(conn, 200) =~ "New Deposit"
    end
  end

  describe "create deposit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/deposits", deposit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/deposits/#{id}"

      conn = get(conn, ~p"/deposits/#{id}")
      assert html_response(conn, 200) =~ "Deposit #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/deposits", deposit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Deposit"
    end
  end

  describe "edit deposit" do
    setup [:create_deposit]

    test "renders form for editing chosen deposit", %{conn: conn, deposit: deposit} do
      conn = get(conn, ~p"/deposits/#{deposit}/edit")
      assert html_response(conn, 200) =~ "Edit Deposit"
    end
  end

  describe "update deposit" do
    setup [:create_deposit]

    test "redirects when data is valid", %{conn: conn, deposit: deposit} do
      conn = put(conn, ~p"/deposits/#{deposit}", deposit: @update_attrs)
      assert redirected_to(conn) == ~p"/deposits/#{deposit}"

      conn = get(conn, ~p"/deposits/#{deposit}")
      assert html_response(conn, 200) =~ "some updated player_id"
    end

    test "renders errors when data is invalid", %{conn: conn, deposit: deposit} do
      conn = put(conn, ~p"/deposits/#{deposit}", deposit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Deposit"
    end
  end

  describe "delete deposit" do
    setup [:create_deposit]

    test "deletes chosen deposit", %{conn: conn, deposit: deposit} do
      conn = delete(conn, ~p"/deposits/#{deposit}")
      assert redirected_to(conn) == ~p"/deposits"

      assert_error_sent 404, fn ->
        get(conn, ~p"/deposits/#{deposit}")
      end
    end
  end

  defp create_deposit(_) do
    deposit = deposit_fixture()

    %{deposit: deposit}
  end
end
