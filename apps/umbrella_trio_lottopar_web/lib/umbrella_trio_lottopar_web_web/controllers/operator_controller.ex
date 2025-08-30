defmodule UmbrellaTrioLottoparWeb.OperatorController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Admin
  alias UmbrellaTrioLottoparWeb.Admin.Operator

  def index(conn, _params) do
    operators = Admin.list_operators()
    render(conn, :index, operators: operators)
  end

  def new(conn, _params) do
    changeset = Admin.change_operator(%Operator{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"operator" => operator_params}) do
    case Admin.create_operator(operator_params) do
      {:ok, operator} ->
        conn
        |> put_flash(:info, "Operator created successfully.")
        |> redirect(to: ~p"/admin/operators/#{operator}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    operator = Admin.get_operator!(id)
    render(conn, :show, operator: operator)
  end

  def edit(conn, %{"id" => id}) do
    operator = Admin.get_operator!(id)
    changeset = Admin.change_operator(operator)
    render(conn, :edit, operator: operator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "operator" => operator_params}) do
    operator = Admin.get_operator!(id)

    case Admin.update_operator(operator, operator_params) do
      {:ok, operator} ->
        conn
        |> put_flash(:info, "Operator updated successfully.")
        |> redirect(to: ~p"/admin/operators/#{operator}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, operator: operator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    operator = Admin.get_operator!(id)
    {:ok, _operator} = Admin.delete_operator(operator)

    conn
    |> put_flash(:info, "Operator deleted successfully.")
    |> redirect(to: ~p"/admin/operators")
  end
end
