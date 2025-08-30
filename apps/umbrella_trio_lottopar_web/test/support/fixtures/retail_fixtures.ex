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
end
