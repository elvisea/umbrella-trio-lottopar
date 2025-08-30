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

  describe "devices" do
    alias UmbrellaTrioLottoparWeb.Retail.Device

    import UmbrellaTrioLottoparWeb.RetailFixtures

    @invalid_attrs %{status: nil, location: nil, retail_id: nil, device_type: nil, activation_date: nil, last_activity: nil, serial_number: nil, model: nil, firmware_version: nil, ip_address: nil, mac_address: nil, coordinates: nil}

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Retail.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Retail.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      valid_attrs = %{status: "some status", location: "some location", retail_id: "some retail_id", device_type: "some device_type", activation_date: ~D[2025-08-29], last_activity: ~N[2025-08-29 22:08:00], serial_number: "some serial_number", model: "some model", firmware_version: "some firmware_version", ip_address: "some ip_address", mac_address: "some mac_address", coordinates: %{}}

      assert {:ok, %Device{} = device} = Retail.create_device(valid_attrs)
      assert device.status == "some status"
      assert device.location == "some location"
      assert device.retail_id == "some retail_id"
      assert device.device_type == "some device_type"
      assert device.activation_date == ~D[2025-08-29]
      assert device.last_activity == ~N[2025-08-29 22:08:00]
      assert device.serial_number == "some serial_number"
      assert device.model == "some model"
      assert device.firmware_version == "some firmware_version"
      assert device.ip_address == "some ip_address"
      assert device.mac_address == "some mac_address"
      assert device.coordinates == %{}
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Retail.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      update_attrs = %{status: "some updated status", location: "some updated location", retail_id: "some updated retail_id", device_type: "some updated device_type", activation_date: ~D[2025-08-30], last_activity: ~N[2025-08-30 22:08:00], serial_number: "some updated serial_number", model: "some updated model", firmware_version: "some updated firmware_version", ip_address: "some updated ip_address", mac_address: "some updated mac_address", coordinates: %{}}

      assert {:ok, %Device{} = device} = Retail.update_device(device, update_attrs)
      assert device.status == "some updated status"
      assert device.location == "some updated location"
      assert device.retail_id == "some updated retail_id"
      assert device.device_type == "some updated device_type"
      assert device.activation_date == ~D[2025-08-30]
      assert device.last_activity == ~N[2025-08-30 22:08:00]
      assert device.serial_number == "some updated serial_number"
      assert device.model == "some updated model"
      assert device.firmware_version == "some updated firmware_version"
      assert device.ip_address == "some updated ip_address"
      assert device.mac_address == "some updated mac_address"
      assert device.coordinates == %{}
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Retail.update_device(device, @invalid_attrs)
      assert device == Retail.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Retail.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Retail.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Retail.change_device(device)
    end
  end
end
