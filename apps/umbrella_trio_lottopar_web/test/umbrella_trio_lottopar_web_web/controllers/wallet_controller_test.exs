defmodule UmbrellaTrioLottoparWeb.WalletControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.FinanceFixtures

  @create_attrs %{player_id: "some player_id", retail_id: "some retail_id", wallet_type: "some wallet_type", currency_code: "some currency_code", total_cash: "120.5", total_bonus: "120.5"}
  @update_attrs %{player_id: "some updated player_id", retail_id: "some updated retail_id", wallet_type: "some updated wallet_type", currency_code: "some updated currency_code", total_cash: "456.7", total_bonus: "456.7"}
  @invalid_attrs %{player_id: nil, retail_id: nil, wallet_type: nil, currency_code: nil, total_cash: nil, total_bonus: nil}

  describe "index" do
    test "lists all wallets", %{conn: conn} do
      conn = get(conn, ~p"/wallets")
      assert html_response(conn, 200) =~ "Listing Wallets"
    end
  end

  describe "new wallet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/wallets/new")
      assert html_response(conn, 200) =~ "New Wallet"
    end
  end

  describe "create wallet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/wallets", wallet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/wallets/#{id}"

      conn = get(conn, ~p"/wallets/#{id}")
      assert html_response(conn, 200) =~ "Wallet #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/wallets", wallet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Wallet"
    end
  end

  describe "edit wallet" do
    setup [:create_wallet]

    test "renders form for editing chosen wallet", %{conn: conn, wallet: wallet} do
      conn = get(conn, ~p"/wallets/#{wallet}/edit")
      assert html_response(conn, 200) =~ "Edit Wallet"
    end
  end

  describe "update wallet" do
    setup [:create_wallet]

    test "redirects when data is valid", %{conn: conn, wallet: wallet} do
      conn = put(conn, ~p"/wallets/#{wallet}", wallet: @update_attrs)
      assert redirected_to(conn) == ~p"/wallets/#{wallet}"

      conn = get(conn, ~p"/wallets/#{wallet}")
      assert html_response(conn, 200) =~ "some updated player_id"
    end

    test "renders errors when data is invalid", %{conn: conn, wallet: wallet} do
      conn = put(conn, ~p"/wallets/#{wallet}", wallet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Wallet"
    end
  end

  describe "delete wallet" do
    setup [:create_wallet]

    test "deletes chosen wallet", %{conn: conn, wallet: wallet} do
      conn = delete(conn, ~p"/wallets/#{wallet}")
      assert redirected_to(conn) == ~p"/wallets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/wallets/#{wallet}")
      end
    end
  end

  defp create_wallet(_) do
    wallet = wallet_fixture()

    %{wallet: wallet}
  end
end
