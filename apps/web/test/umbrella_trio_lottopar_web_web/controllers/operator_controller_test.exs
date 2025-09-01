defmodule UmbrellaTrioLottoparWeb.OperatorControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.AdminFixtures

  @create_attrs %{
    name: "some name",
    status: "some status",
    company_name: "some company_name",
    tax_id: "some tax_id",
    country: "some country",
    timezone: "some timezone"
  }
  @update_attrs %{
    name: "some updated name",
    status: "some updated status",
    company_name: "some updated company_name",
    tax_id: "some updated tax_id",
    country: "some updated country",
    timezone: "some updated timezone"
  }
  @invalid_attrs %{
    name: nil,
    status: nil,
    company_name: nil,
    tax_id: nil,
    country: nil,
    timezone: nil
  }

  describe "index" do
    test "lists all operators", %{conn: conn} do
      conn = get(conn, ~p"/operators")
      assert html_response(conn, 200) =~ "Listing Operators"
    end
  end

  describe "new operator" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/operators/new")
      assert html_response(conn, 200) =~ "New Operator"
    end
  end

  describe "create operator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/operators", operator: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/operators/#{id}"

      conn = get(conn, ~p"/operators/#{id}")
      assert html_response(conn, 200) =~ "Operator #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/operators", operator: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Operator"
    end
  end

  describe "edit operator" do
    setup [:create_operator]

    test "renders form for editing chosen operator", %{conn: conn, operator: operator} do
      conn = get(conn, ~p"/operators/#{operator}/edit")
      assert html_response(conn, 200) =~ "Edit Operator"
    end
  end

  describe "update operator" do
    setup [:create_operator]

    test "redirects when data is valid", %{conn: conn, operator: operator} do
      conn = put(conn, ~p"/operators/#{operator}", operator: @update_attrs)
      assert redirected_to(conn) == ~p"/operators/#{operator}"

      conn = get(conn, ~p"/operators/#{operator}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, operator: operator} do
      conn = put(conn, ~p"/operators/#{operator}", operator: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Operator"
    end
  end

  describe "delete operator" do
    setup [:create_operator]

    test "deletes chosen operator", %{conn: conn, operator: operator} do
      conn = delete(conn, ~p"/operators/#{operator}")
      assert redirected_to(conn) == ~p"/operators"

      assert_error_sent 404, fn ->
        get(conn, ~p"/operators/#{operator}")
      end
    end
  end

  defp create_operator(_) do
    operator = operator_fixture()

    %{operator: operator}
  end
end
