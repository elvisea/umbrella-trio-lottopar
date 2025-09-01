defmodule Web.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Web.Admin` context.
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
      |> Web.Admin.create_operator()

    operator
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        op_id: "some op_id",
        otp: "some otp",
        password: "some password",
        status: "some status",
        user_type: "some user_type",
        username: "some username"
      })
      |> Web.Admin.create_user()

    user
  end
end
