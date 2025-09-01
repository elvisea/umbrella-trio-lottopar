defmodule UmbrellaTrioLottoparWeb.WalletController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Finance
  alias Core.Finance.Wallet

  def index(conn, _params) do
    wallets = Finance.list_wallets()
    render(conn, :index, wallets: wallets)
  end

  def new(conn, _params) do
    changeset = Finance.change_wallet(%Wallet{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"wallet" => wallet_params}) do
    case Finance.create_wallet(wallet_params) do
      {:ok, wallet} ->
        conn
        |> put_flash(:info, "Wallet created successfully.")
        |> redirect(to: ~p"/wallets/#{wallet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wallet = Finance.get_wallet!(id)
    render(conn, :show, wallet: wallet)
  end

  def edit(conn, %{"id" => id}) do
    wallet = Finance.get_wallet!(id)
    changeset = Finance.change_wallet(wallet)
    render(conn, :edit, wallet: wallet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "wallet" => wallet_params}) do
    wallet = Finance.get_wallet!(id)

    case Finance.update_wallet(wallet, wallet_params) do
      {:ok, wallet} ->
        conn
        |> put_flash(:info, "Wallet updated successfully.")
        |> redirect(to: ~p"/wallets/#{wallet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, wallet: wallet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wallet = Finance.get_wallet!(id)
    {:ok, _wallet} = Finance.delete_wallet(wallet)

    conn
    |> put_flash(:info, "Wallet deleted successfully.")
    |> redirect(to: ~p"/wallets")
  end
end
