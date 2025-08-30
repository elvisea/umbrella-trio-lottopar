defmodule UmbrellaTrioLottoparWeb.PlayerControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.PlayersFixtures

  @create_attrs %{status: "some status", state: "some state", address: "some address", username: "some username", password: "some password", op_id: "some op_id", first_name: "some first_name", last_name: "some last_name", document: "some document", birth_date: ~D[2025-08-29], phone: "some phone", email: "some email", gender: "some gender", city: "some city", country: "some country", zip_code: "some zip_code", registration_date: ~D[2025-08-29], last_login: ~N[2025-08-29 20:54:00]}
  @update_attrs %{status: "some updated status", state: "some updated state", address: "some updated address", username: "some updated username", password: "some updated password", op_id: "some updated op_id", first_name: "some updated first_name", last_name: "some updated last_name", document: "some updated document", birth_date: ~D[2025-08-30], phone: "some updated phone", email: "some updated email", gender: "some updated gender", city: "some updated city", country: "some updated country", zip_code: "some updated zip_code", registration_date: ~D[2025-08-30], last_login: ~N[2025-08-30 20:54:00]}
  @invalid_attrs %{status: nil, state: nil, address: nil, username: nil, password: nil, op_id: nil, first_name: nil, last_name: nil, document: nil, birth_date: nil, phone: nil, email: nil, gender: nil, city: nil, country: nil, zip_code: nil, registration_date: nil, last_login: nil}

  describe "index" do
    test "lists all players", %{conn: conn} do
      conn = get(conn, ~p"/players")
      assert html_response(conn, 200) =~ "Listing Players"
    end
  end

  describe "new player" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/players/new")
      assert html_response(conn, 200) =~ "New Player"
    end
  end

  describe "create player" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/players", player: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/players/#{id}"

      conn = get(conn, ~p"/players/#{id}")
      assert html_response(conn, 200) =~ "Player #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/players", player: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Player"
    end
  end

  describe "edit player" do
    setup [:create_player]

    test "renders form for editing chosen player", %{conn: conn, player: player} do
      conn = get(conn, ~p"/players/#{player}/edit")
      assert html_response(conn, 200) =~ "Edit Player"
    end
  end

  describe "update player" do
    setup [:create_player]

    test "redirects when data is valid", %{conn: conn, player: player} do
      conn = put(conn, ~p"/players/#{player}", player: @update_attrs)
      assert redirected_to(conn) == ~p"/players/#{player}"

      conn = get(conn, ~p"/players/#{player}")
      assert html_response(conn, 200) =~ "some updated op_id"
    end

    test "renders errors when data is invalid", %{conn: conn, player: player} do
      conn = put(conn, ~p"/players/#{player}", player: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Player"
    end
  end

  describe "delete player" do
    setup [:create_player]

    test "deletes chosen player", %{conn: conn, player: player} do
      conn = delete(conn, ~p"/players/#{player}")
      assert redirected_to(conn) == ~p"/players"

      assert_error_sent 404, fn ->
        get(conn, ~p"/players/#{player}")
      end
    end
  end

  defp create_player(_) do
    player = player_fixture()

    %{player: player}
  end
end
