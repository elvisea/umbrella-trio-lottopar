defmodule UmbrellaTrioLottoparWeb.WagerController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Games
  alias UmbrellaTrioLottoparWeb.Games.Wager

  def index(conn, _params) do
    wagers = Games.list_wagers()
    render(conn, :index, wagers: wagers)
  end

  def new(conn, _params) do
    changeset = Games.change_wager(%Wager{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"wager" => wager_params}) do
    case Games.create_wager(wager_params) do
      {:ok, wager} ->
        conn
        |> put_flash(:info, "Wager created successfully.")
        |> redirect(to: ~p"/games/wagers/#{wager}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wager = Games.get_wager!(id)
    render(conn, :show, wager: wager)
  end

  def edit(conn, %{"id" => id}) do
    wager = Games.get_wager!(id)
    changeset = Games.change_wager(wager)
    render(conn, :edit, wager: wager, changeset: changeset)
  end

  def update(conn, %{"id" => id, "wager" => wager_params}) do
    wager = Games.get_wager!(id)

    case Games.update_wager(wager, wager_params) do
      {:ok, wager} ->
        conn
        |> put_flash(:info, "Wager updated successfully.")
        |> redirect(to: ~p"/games/wagers/#{wager}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, wager: wager, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wager = Games.get_wager!(id)
    {:ok, _wager} = Games.delete_wager(wager)

    conn
    |> put_flash(:info, "Wager deleted successfully.")
    |> redirect(to: ~p"/games/wagers")
  end
end
