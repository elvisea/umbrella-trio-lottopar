defmodule UmbrellaTrioLottoparWeb.DepositController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Finance
  alias Core.Finance.Deposit

  def index(conn, _params) do
    deposits = Finance.list_deposits()
    render(conn, :index, deposits: deposits)
  end

  def new(conn, _params) do
    changeset = Finance.change_deposit(%Deposit{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"deposit" => deposit_params}) do
    case Finance.create_deposit(deposit_params) do
      {:ok, deposit} ->
        conn
        |> put_flash(:info, "Deposit created successfully.")
        |> redirect(to: ~p"/deposits/#{deposit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deposit = Finance.get_deposit!(id)
    render(conn, :show, deposit: deposit)
  end

  def edit(conn, %{"id" => id}) do
    deposit = Finance.get_deposit!(id)
    changeset = Finance.change_deposit(deposit)
    render(conn, :edit, deposit: deposit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deposit" => deposit_params}) do
    deposit = Finance.get_deposit!(id)

    case Finance.update_deposit(deposit, deposit_params) do
      {:ok, deposit} ->
        conn
        |> put_flash(:info, "Deposit updated successfully.")
        |> redirect(to: ~p"/deposits/#{deposit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, deposit: deposit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deposit = Finance.get_deposit!(id)
    {:ok, _deposit} = Finance.delete_deposit(deposit)

    conn
    |> put_flash(:info, "Deposit deleted successfully.")
    |> redirect(to: ~p"/deposits")
  end
end
