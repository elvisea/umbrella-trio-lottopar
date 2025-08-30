defmodule UmbrellaTrioLottoparWeb.RetailFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmbrellaTrioLottoparWeb.Retail` context.
  """

  @doc """
  Generate a retails.
  """
  def retails_fixture(attrs \\ %{}) do
    {:ok, retails} =
      attrs
      |> Enum.into(%{
        address: "some address",
        city: "some city",
        country: "some country",
        email: "some email",
        manager_name: "some manager_name",
        name: "some name",
        op_id: "some op_id",
        phone: "some phone",
        state: "some state",
        status: "some status",
        tax_id: "some tax_id",
        zip_code: "some zip_code"
      })
      |> UmbrellaTrioLottoparWeb.Retail.create_retails()

    retails
  end

  @doc """
  Generate a device.
  """
  def device_fixture(attrs \\ %{}) do
    {:ok, device} =
      attrs
      |> Enum.into(%{
        activation_date: ~D[2025-08-29],
        coordinates: %{},
        device_type: "some device_type",
        firmware_version: "some firmware_version",
        ip_address: "some ip_address",
        last_activity: ~N[2025-08-29 22:08:00],
        location: "some location",
        mac_address: "some mac_address",
        model: "some model",
        retail_id: "some retail_id",
        serial_number: "some serial_number",
        status: "some status"
      })
      |> UmbrellaTrioLottoparWeb.Retail.create_device()

    device
  end
end
