defmodule UmbrellaTrioLottoparWeb.RetailTest do
  use UmbrellaTrioLottoparWeb.DataCase

  alias UmbrellaTrioLottoparWeb.Retail

  describe "retails" do
    alias UmbrellaTrioLottoparWeb.Retail.Retails

    import UmbrellaTrioLottoparWeb.RetailFixtures

    @invalid_attrs %{name: nil, status: nil, state: nil, address: nil, op_id: nil, tax_id: nil, city: nil, country: nil, zip_code: nil, phone: nil, email: nil, manager_name: nil}

    test "list_retails/0 returns all retails" do
      retails = retails_fixture()
      assert Retail.list_retails() == [retails]
    end

    test "get_retails!/1 returns the retails with given id" do
      retails = retails_fixture()
      assert Retail.get_retails!(retails.id) == retails
    end

    test "create_retails/1 with valid data creates a retails" do
      valid_attrs = %{name: "some name", status: "some status", state: "some state", address: "some address", op_id: "some op_id", tax_id: "some tax_id", city: "some city", country: "some country", zip_code: "some zip_code", phone: "some phone", email: "some email", manager_name: "some manager_name"}

      assert {:ok, %Retails{} = retails} = Retail.create_retails(valid_attrs)
      assert retails.name == "some name"
      assert retails.status == "some status"
      assert retails.state == "some state"
      assert retails.address == "some address"
      assert retails.op_id == "some op_id"
      assert retails.tax_id == "some tax_id"
      assert retails.city == "some city"
      assert retails.country == "some country"
      assert retails.zip_code == "some zip_code"
      assert retails.phone == "some phone"
      assert retails.email == "some email"
      assert retails.manager_name == "some manager_name"
    end

    test "create_retails/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Retail.create_retails(@invalid_attrs)
    end

    test "update_retails/2 with valid data updates the retails" do
      retails = retails_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", state: "some updated state", address: "some updated address", op_id: "some updated op_id", tax_id: "some updated tax_id", city: "some updated city", country: "some updated country", zip_code: "some updated zip_code", phone: "some updated phone", email: "some updated email", manager_name: "some updated manager_name"}

      assert {:ok, %Retails{} = retails} = Retail.update_retails(retails, update_attrs)
      assert retails.name == "some updated name"
      assert retails.status == "some updated status"
      assert retails.state == "some updated state"
      assert retails.address == "some updated address"
      assert retails.op_id == "some updated op_id"
      assert retails.tax_id == "some updated tax_id"
      assert retails.city == "some updated city"
      assert retails.country == "some updated country"
      assert retails.zip_code == "some updated zip_code"
      assert retails.phone == "some updated phone"
      assert retails.email == "some updated email"
      assert retails.manager_name == "some updated manager_name"
    end

    test "update_retails/2 with invalid data returns error changeset" do
      retails = retails_fixture()
      assert {:error, %Ecto.Changeset{}} = Retail.update_retails(retails, @invalid_attrs)
      assert retails == Retail.get_retails!(retails.id)
    end

    test "delete_retails/1 deletes the retails" do
      retails = retails_fixture()
      assert {:ok, %Retails{}} = Retail.delete_retails(retails)
      assert_raise Ecto.NoResultsError, fn -> Retail.get_retails!(retails.id) end
    end

    test "change_retails/1 returns a retails changeset" do
      retails = retails_fixture()
      assert %Ecto.Changeset{} = Retail.change_retails(retails)
    end
  end
end
