defmodule UmbrellaTrioLottoparWeb.RetailsControllerTest do
  use UmbrellaTrioLottoparWeb.ConnCase

  import UmbrellaTrioLottoparWeb.RetailFixtures

  @create_attrs %{name: "some name", status: "some status", state: "some state", address: "some address", op_id: "some op_id", tax_id: "some tax_id", city: "some city", country: "some country", zip_code: "some zip_code", phone: "some phone", email: "some email", manager_name: "some manager_name"}
  @update_attrs %{name: "some updated name", status: "some updated status", state: "some updated state", address: "some updated address", op_id: "some updated op_id", tax_id: "some updated tax_id", city: "some updated city", country: "some updated country", zip_code: "some updated zip_code", phone: "some updated phone", email: "some updated email", manager_name: "some updated manager_name"}
  @invalid_attrs %{name: nil, status: nil, state: nil, address: nil, op_id: nil, tax_id: nil, city: nil, country: nil, zip_code: nil, phone: nil, email: nil, manager_name: nil}

  describe "index" do
    test "lists all retails", %{conn: conn} do
      conn = get(conn, ~p"/retails")
      assert html_response(conn, 200) =~ "Listing Retails"
    end
  end

  describe "new retails" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/retails/new")
      assert html_response(conn, 200) =~ "New Retails"
    end
  end

  describe "create retails" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/retails", retails: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/retails/#{id}"

      conn = get(conn, ~p"/retails/#{id}")
      assert html_response(conn, 200) =~ "Retails #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/retails", retails: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Retails"
    end
  end

  describe "edit retails" do
    setup [:create_retails]

    test "renders form for editing chosen retails", %{conn: conn, retails: retails} do
      conn = get(conn, ~p"/retails/#{retails}/edit")
      assert html_response(conn, 200) =~ "Edit Retails"
    end
  end

  describe "update retails" do
    setup [:create_retails]

    test "redirects when data is valid", %{conn: conn, retails: retails} do
      conn = put(conn, ~p"/retails/#{retails}", retails: @update_attrs)
      assert redirected_to(conn) == ~p"/retails/#{retails}"

      conn = get(conn, ~p"/retails/#{retails}")
      assert html_response(conn, 200) =~ "some updated op_id"
    end

    test "renders errors when data is invalid", %{conn: conn, retails: retails} do
      conn = put(conn, ~p"/retails/#{retails}", retails: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Retails"
    end
  end

  describe "delete retails" do
    setup [:create_retails]

    test "deletes chosen retails", %{conn: conn, retails: retails} do
      conn = delete(conn, ~p"/retails/#{retails}")
      assert redirected_to(conn) == ~p"/retails"

      assert_error_sent 404, fn ->
        get(conn, ~p"/retails/#{retails}")
      end
    end
  end

  defp create_retails(_) do
    retails = retails_fixture()

    %{retails: retails}
  end
end
