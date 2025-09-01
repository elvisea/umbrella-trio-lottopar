defmodule UmbrellaTrioLottoparWeb.WagerControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.GamesFixtures

  @create_attrs %{player_id: "some player_id", op_id: "some op_id", txn_amount: "120.5", bonus_amount: "120.5", cash_amount: "120.5", tax_amount: "120.5", txn_status: "some txn_status", txn_date: ~N[2025-08-31 20:16:00], txn_mode: "some txn_mode", process_charges: "some process_charges", codigo_lottopar: "some codigo_lottopar", ref_txn_id: "some ref_txn_id", service_charges: "some service_charges", tp_txn_id: "some tp_txn_id", sale_transaction_id: "some sale_transaction_id", ticket_number: "some ticket_number", game_id: "some game_id", game_type: "some game_type", game_name: "some game_name", game_data: %{}, event: %{}, retail_data: %{}}
  @update_attrs %{player_id: "some updated player_id", op_id: "some updated op_id", txn_amount: "456.7", bonus_amount: "456.7", cash_amount: "456.7", tax_amount: "456.7", txn_status: "some updated txn_status", txn_date: ~N[2025-09-01 20:16:00], txn_mode: "some updated txn_mode", process_charges: "some updated process_charges", codigo_lottopar: "some updated codigo_lottopar", ref_txn_id: "some updated ref_txn_id", service_charges: "some updated service_charges", tp_txn_id: "some updated tp_txn_id", sale_transaction_id: "some updated sale_transaction_id", ticket_number: "some updated ticket_number", game_id: "some updated game_id", game_type: "some updated game_type", game_name: "some updated game_name", game_data: %{}, event: %{}, retail_data: %{}}
  @invalid_attrs %{player_id: nil, op_id: nil, txn_amount: nil, bonus_amount: nil, cash_amount: nil, tax_amount: nil, txn_status: nil, txn_date: nil, txn_mode: nil, process_charges: nil, codigo_lottopar: nil, ref_txn_id: nil, service_charges: nil, tp_txn_id: nil, sale_transaction_id: nil, ticket_number: nil, game_id: nil, game_type: nil, game_name: nil, game_data: nil, event: nil, retail_data: nil}

  describe "index" do
    test "lists all wagers", %{conn: conn} do
      conn = get(conn, ~p"/wagers")
      assert html_response(conn, 200) =~ "Listing Wagers"
    end
  end

  describe "new wager" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/wagers/new")
      assert html_response(conn, 200) =~ "New Wager"
    end
  end

  describe "create wager" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/wagers", wager: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/wagers/#{id}"

      conn = get(conn, ~p"/wagers/#{id}")
      assert html_response(conn, 200) =~ "Wager #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/wagers", wager: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Wager"
    end
  end

  describe "edit wager" do
    setup [:create_wager]

    test "renders form for editing chosen wager", %{conn: conn, wager: wager} do
      conn = get(conn, ~p"/wagers/#{wager}/edit")
      assert html_response(conn, 200) =~ "Edit Wager"
    end
  end

  describe "update wager" do
    setup [:create_wager]

    test "redirects when data is valid", %{conn: conn, wager: wager} do
      conn = put(conn, ~p"/wagers/#{wager}", wager: @update_attrs)
      assert redirected_to(conn) == ~p"/wagers/#{wager}"

      conn = get(conn, ~p"/wagers/#{wager}")
      assert html_response(conn, 200) =~ "some updated player_id"
    end

    test "renders errors when data is invalid", %{conn: conn, wager: wager} do
      conn = put(conn, ~p"/wagers/#{wager}", wager: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Wager"
    end
  end

  describe "delete wager" do
    setup [:create_wager]

    test "deletes chosen wager", %{conn: conn, wager: wager} do
      conn = delete(conn, ~p"/wagers/#{wager}")
      assert redirected_to(conn) == ~p"/wagers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/wagers/#{wager}")
      end
    end
  end

  defp create_wager(_) do
    wager = wager_fixture()

    %{wager: wager}
  end
end
