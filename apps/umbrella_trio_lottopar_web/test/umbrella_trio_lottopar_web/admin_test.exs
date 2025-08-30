defmodule UmbrellaTrioLottoparWeb.AdminTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Admin

  describe "operators" do
    alias UmbrellaTrioLottoparWeb.Admin.Operator

    import UmbrellaTrioLottoparWeb.AdminFixtures

    @invalid_attrs %{
      name: nil,
      status: nil,
      company_name: nil,
      tax_id: nil,
      country: nil,
      timezone: nil
    }

    test "list_operators/0 returns all operators" do
      operator = operator_fixture()
      assert Admin.list_operators() == [operator]
    end

    test "get_operator!/1 returns the operator with given id" do
      operator = operator_fixture()
      assert Admin.get_operator!(operator.id) == operator
    end

    test "create_operator/1 with valid data creates a operator" do
      valid_attrs = %{
        name: "some name",
        status: "some status",
        company_name: "some company_name",
        tax_id: "some tax_id",
        country: "some country",
        timezone: "some timezone"
      }

      assert {:ok, %Operator{} = operator} = Admin.create_operator(valid_attrs)
      assert operator.name == "some name"
      assert operator.status == "some status"
      assert operator.company_name == "some company_name"
      assert operator.tax_id == "some tax_id"
      assert operator.country == "some country"
      assert operator.timezone == "some timezone"
    end

    test "create_operator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_operator(@invalid_attrs)
    end

    test "update_operator/2 with valid data updates the operator" do
      operator = operator_fixture()

      update_attrs = %{
        name: "some updated name",
        status: "some updated status",
        company_name: "some updated company_name",
        tax_id: "some updated tax_id",
        country: "some updated country",
        timezone: "some updated timezone"
      }

      assert {:ok, %Operator{} = operator} = Admin.update_operator(operator, update_attrs)
      assert operator.name == "some updated name"
      assert operator.status == "some updated status"
      assert operator.company_name == "some updated company_name"
      assert operator.tax_id == "some updated tax_id"
      assert operator.country == "some updated country"
      assert operator.timezone == "some updated timezone"
    end

    test "update_operator/2 with invalid data returns error changeset" do
      operator = operator_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_operator(operator, @invalid_attrs)
      assert operator == Admin.get_operator!(operator.id)
    end

    test "delete_operator/1 deletes the operator" do
      operator = operator_fixture()
      assert {:ok, %Operator{}} = Admin.delete_operator(operator)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_operator!(operator.id) end
    end

    test "change_operator/1 returns a operator changeset" do
      operator = operator_fixture()
      assert %Ecto.Changeset{} = Admin.change_operator(operator)
    end
  end
end
