defmodule Web.PlayersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Web.Players` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        address: "some address",
        birth_date: ~D[2025-08-29],
        city: "some city",
        country: "some country",
        document: "some document",
        email: "some email",
        first_name: "some first_name",
        gender: "some gender",
        last_login: ~N[2025-08-29 20:54:00],
        last_name: "some last_name",
        op_id: "some op_id",
        password: "some password",
        phone: "some phone",
        registration_date: ~D[2025-08-29],
        state: "some state",
        status: "some status",
        username: "some username",
        zip_code: "some zip_code"
      })
      |> Web.Players.create_player()

    player
  end
end
