defmodule UmbrellaTrioLottoparWeb.WithdrawControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.FinanceFixtures

  @create_attrs %{
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
  @update_attrs %{
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

  describe "index" do
    test "lists all withdraws", %{conn: conn} do
      conn = get(conn, ~p"/withdraws")
      assert html_response(conn, 200) =~ "Listing Withdraws"
    end
  end

  describe "new withdraw" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/withdraws/new")
      assert html_response(conn, 200) =~ "New Withdraw"
    end
  end

  describe "create withdraw" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/withdraws", withdraw: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/withdraws/#{id}"

      conn = get(conn, ~p"/withdraws/#{id}")
      assert html_response(conn, 200) =~ "Withdraw #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/withdraws", withdraw: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Withdraw"
    end
  end

  describe "edit withdraw" do
    setup [:create_withdraw]

    test "renders form for editing chosen withdraw", %{conn: conn, withdraw: withdraw} do
      conn = get(conn, ~p"/withdraws/#{withdraw}/edit")
      assert html_response(conn, 200) =~ "Edit Withdraw"
    end
  end

  describe "update withdraw" do
    setup [:create_withdraw]

    test "redirects when data is valid", %{conn: conn, withdraw: withdraw} do
      conn = put(conn, ~p"/withdraws/#{withdraw}", withdraw: @update_attrs)
      assert redirected_to(conn) == ~p"/withdraws/#{withdraw}"

      conn = get(conn, ~p"/withdraws/#{withdraw}")
      assert html_response(conn, 200) =~ "some updated player_id"
    end

    test "renders errors when data is invalid", %{conn: conn, withdraw: withdraw} do
      conn = put(conn, ~p"/withdraws/#{withdraw}", withdraw: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Withdraw"
    end
  end

  describe "delete withdraw" do
    setup [:create_withdraw]

    test "deletes chosen withdraw", %{conn: conn, withdraw: withdraw} do
      conn = delete(conn, ~p"/withdraws/#{withdraw}")
      assert redirected_to(conn) == ~p"/withdraws"

      assert_error_sent 404, fn ->
        get(conn, ~p"/withdraws/#{withdraw}")
      end
    end
  end

  defp create_withdraw(_) do
    withdraw = withdraw_fixture()

    %{withdraw: withdraw}
  end
end
