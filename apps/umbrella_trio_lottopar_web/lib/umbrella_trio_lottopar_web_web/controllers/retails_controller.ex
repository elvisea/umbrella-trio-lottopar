defmodule UmbrellaTrioLottoparWeb.RetailsController do
  use UmbrellaTrioLottoparWeb, :controller

  alias UmbrellaTrioLottoparWeb.Retail, as: RetailContext
  alias Core.Retail.Retail

  def index(conn, _params) do
    retails = RetailContext.list_retails()
    render(conn, :index, retails_collection: retails)
  end

  def new(conn, _params) do
    changeset = RetailContext.change_retail(%Retail{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"retails" => retails_params}) do
    case RetailContext.create_retail(retails_params) do
      {:ok, retail} ->
        conn
        |> put_flash(:info, "Retail created successfully.")
        |> redirect(to: ~p"/retails/#{retail}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retail = RetailContext.get_retail!(id)
    render(conn, :show, retails: retail)
  end

  def edit(conn, %{"id" => id}) do
    retail = RetailContext.get_retail!(id)
    changeset = RetailContext.change_retail(retail)
    render(conn, :edit, retails: retail, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retails" => retails_params}) do
    retail = RetailContext.get_retail!(id)

    case RetailContext.update_retail(retail, retails_params) do
      {:ok, retail} ->
        conn
        |> put_flash(:info, "Retail updated successfully.")
        |> redirect(to: ~p"/retails/#{retail}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, retails: retail, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retail = RetailContext.get_retail!(id)
    {:ok, _retail} = RetailContext.delete_retail(retail)

    conn
    |> put_flash(:info, "Retail deleted successfully.")
    |> redirect(to: ~p"/retails")
  end
end
