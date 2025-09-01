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

  describe "users" do
    alias UmbrellaTrioLottoparWeb.Admin.User

    import UmbrellaTrioLottoparWeb.AdminFixtures

    @invalid_attrs %{status: nil, otp: nil, user_type: nil, username: nil, password: nil, op_id: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{status: "some status", otp: "some otp", user_type: "some user_type", username: "some username", password: "some password", op_id: "some op_id"}

      assert {:ok, %User{} = user} = Admin.create_user(valid_attrs)
      assert user.status == "some status"
      assert user.otp == "some otp"
      assert user.user_type == "some user_type"
      assert user.username == "some username"
      assert user.password == "some password"
      assert user.op_id == "some op_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{status: "some updated status", otp: "some updated otp", user_type: "some updated user_type", username: "some updated username", password: "some updated password", op_id: "some updated op_id"}

      assert {:ok, %User{} = user} = Admin.update_user(user, update_attrs)
      assert user.status == "some updated status"
      assert user.otp == "some updated otp"
      assert user.user_type == "some updated user_type"
      assert user.username == "some updated username"
      assert user.password == "some updated password"
      assert user.op_id == "some updated op_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end
end
