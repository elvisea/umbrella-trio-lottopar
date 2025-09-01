defmodule UmbrellaTrioLottoparWeb.PlayersTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Players

  describe "players" do
    alias UmbrellaTrioLottoparWeb.Players.Player

    import UmbrellaTrioLottoparWeb.PlayersFixtures

    @invalid_attrs %{
      status: nil,
      state: nil,
      address: nil,
      username: nil,
      password: nil,
      op_id: nil,
      first_name: nil,
      last_name: nil,
      document: nil,
      birth_date: nil,
      phone: nil,
      email: nil,
      gender: nil,
      city: nil,
      country: nil,
      zip_code: nil,
      registration_date: nil,
      last_login: nil
    }

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Players.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Players.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{
        status: "some status",
        state: "some state",
        address: "some address",
        username: "some username",
        password: "some password",
        op_id: "some op_id",
        first_name: "some first_name",
        last_name: "some last_name",
        document: "some document",
        birth_date: ~D[2025-08-29],
        phone: "some phone",
        email: "some email",
        gender: "some gender",
        city: "some city",
        country: "some country",
        zip_code: "some zip_code",
        registration_date: ~D[2025-08-29],
        last_login: ~N[2025-08-29 20:54:00]
      }

      assert {:ok, %Player{} = player} = Players.create_player(valid_attrs)
      assert player.status == "some status"
      assert player.state == "some state"
      assert player.address == "some address"
      assert player.username == "some username"
      assert player.password == "some password"
      assert player.op_id == "some op_id"
      assert player.first_name == "some first_name"
      assert player.last_name == "some last_name"
      assert player.document == "some document"
      assert player.birth_date == ~D[2025-08-29]
      assert player.phone == "some phone"
      assert player.email == "some email"
      assert player.gender == "some gender"
      assert player.city == "some city"
      assert player.country == "some country"
      assert player.zip_code == "some zip_code"
      assert player.registration_date == ~D[2025-08-29]
      assert player.last_login == ~N[2025-08-29 20:54:00]
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()

      update_attrs = %{
        status: "some updated status",
        state: "some updated state",
        address: "some updated address",
        username: "some updated username",
        password: "some updated password",
        op_id: "some updated op_id",
        first_name: "some updated first_name",
        last_name: "some updated last_name",
        document: "some updated document",
        birth_date: ~D[2025-08-30],
        phone: "some updated phone",
        email: "some updated email",
        gender: "some updated gender",
        city: "some updated city",
        country: "some updated country",
        zip_code: "some updated zip_code",
        registration_date: ~D[2025-08-30],
        last_login: ~N[2025-08-30 20:54:00]
      }

      assert {:ok, %Player{} = player} = Players.update_player(player, update_attrs)
      assert player.status == "some updated status"
      assert player.state == "some updated state"
      assert player.address == "some updated address"
      assert player.username == "some updated username"
      assert player.password == "some updated password"
      assert player.op_id == "some updated op_id"
      assert player.first_name == "some updated first_name"
      assert player.last_name == "some updated last_name"
      assert player.document == "some updated document"
      assert player.birth_date == ~D[2025-08-30]
      assert player.phone == "some updated phone"
      assert player.email == "some updated email"
      assert player.gender == "some updated gender"
      assert player.city == "some updated city"
      assert player.country == "some updated country"
      assert player.zip_code == "some updated zip_code"
      assert player.registration_date == ~D[2025-08-30]
      assert player.last_login == ~N[2025-08-30 20:54:00]
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_player(player, @invalid_attrs)
      assert player == Players.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Players.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Players.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Players.change_player(player)
    end
  end
end
