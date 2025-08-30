defmodule UmbrellaTrioLottoparWeb.RetailsController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Retail
  alias UmbrellaTrioLottoparWeb.Retail.Retails

  def index(conn, _params) do
    retails = Retail.list_retails()
    render(conn, :index, retails_collection: retails)
  end

  def new(conn, _params) do
    changeset = Retail.change_retails(%Retails{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"retails" => retails_params}) do
    case Retail.create_retails(retails_params) do
      {:ok, retails} ->
        conn
        |> put_flash(:info, "Retails created successfully.")
        |> redirect(to: ~p"/retails/#{retails}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retails = Retail.get_retails!(id)
    render(conn, :show, retails: retails)
  end

  def edit(conn, %{"id" => id}) do
    retails = Retail.get_retails!(id)
    changeset = Retail.change_retails(retails)
    render(conn, :edit, retails: retails, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retails" => retails_params}) do
    retails = Retail.get_retails!(id)

    case Retail.update_retails(retails, retails_params) do
      {:ok, retails} ->
        conn
        |> put_flash(:info, "Retails updated successfully.")
        |> redirect(to: ~p"/retails/#{retails}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, retails: retails, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retails = Retail.get_retails!(id)
    {:ok, _retails} = Retail.delete_retails(retails)

    conn
    |> put_flash(:info, "Retails deleted successfully.")
    |> redirect(to: ~p"/retails")
  end
end
