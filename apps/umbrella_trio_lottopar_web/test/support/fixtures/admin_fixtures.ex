defmodule UmbrellaTrioLottoparWeb.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmbrellaTrioLottoparWeb.Admin` context.
  """

  @doc """
  Generate a operator.
  """
  def operator_fixture(attrs \\ %{}) do
    {:ok, operator} =
      attrs
      |> Enum.into(%{
        company_name: "some company_name",
        country: "some country",
        name: "some name",
        status: "some status",
        tax_id: "some tax_id",
        timezone: "some timezone"
      })
      |> UmbrellaTrioLottoparWeb.Admin.create_operator()

    operator
  end
end
