defmodule Web.DeviceController do
  use Web, :controller

  alias Web.Retail
  alias Core.Retail.Device

  def index(conn, _params) do
    devices = Retail.list_devices()
    render(conn, :index, devices: devices)
  end

  def new(conn, _params) do
    changeset = Retail.change_device(%Device{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"device" => device_params}) do
    case Retail.create_device(device_params) do
      {:ok, device} ->
        conn
        |> put_flash(:info, "Device created successfully.")
        |> redirect(to: ~p"/devices/#{device}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    device = Retail.get_device!(id)
    render(conn, :show, device: device)
  end

  def edit(conn, %{"id" => id}) do
    device = Retail.get_device!(id)
    changeset = Retail.change_device(device)
    render(conn, :edit, device: device, changeset: changeset)
  end

  def update(conn, %{"id" => id, "device" => device_params}) do
    device = Retail.get_device!(id)

    case Retail.update_device(device, device_params) do
      {:ok, device} ->
        conn
        |> put_flash(:info, "Device updated successfully.")
        |> redirect(to: ~p"/devices/#{device}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, device: device, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    device = Retail.get_device!(id)
    {:ok, _device} = Retail.delete_device(device)

    conn
    |> put_flash(:info, "Device deleted successfully.")
    |> redirect(to: ~p"/devices")
  end
end
