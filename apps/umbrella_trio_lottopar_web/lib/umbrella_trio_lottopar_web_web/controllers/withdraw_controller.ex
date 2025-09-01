defmodule UmbrellaTrioLottoparWeb.WithdrawController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Finance
  alias Core.Finance.Withdraw

  def index(conn, _params) do
    withdraws = Finance.list_withdraws()
    render(conn, :index, withdraws: withdraws)
  end

  def new(conn, _params) do
    changeset = Finance.change_withdraw(%Withdraw{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"withdraw" => withdraw_params}) do
    case Finance.create_withdraw(withdraw_params) do
      {:ok, withdraw} ->
        conn
        |> put_flash(:info, "Withdraw created successfully.")
        |> redirect(to: ~p"/withdraws/#{withdraw}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    withdraw = Finance.get_withdraw!(id)
    render(conn, :show, withdraw: withdraw)
  end

  def edit(conn, %{"id" => id}) do
    withdraw = Finance.get_withdraw!(id)
    changeset = Finance.change_withdraw(withdraw)
    render(conn, :edit, withdraw: withdraw, changeset: changeset)
  end

  def update(conn, %{"id" => id, "withdraw" => withdraw_params}) do
    withdraw = Finance.get_withdraw!(id)

    case Finance.update_withdraw(withdraw, withdraw_params) do
      {:ok, withdraw} ->
        conn
        |> put_flash(:info, "Withdraw updated successfully.")
        |> redirect(to: ~p"/withdraws/#{withdraw}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, withdraw: withdraw, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    withdraw = Finance.get_withdraw!(id)
    {:ok, _withdraw} = Finance.delete_withdraw(withdraw)

    conn
    |> put_flash(:info, "Withdraw deleted successfully.")
    |> redirect(to: ~p"/withdraws")
  end
end
