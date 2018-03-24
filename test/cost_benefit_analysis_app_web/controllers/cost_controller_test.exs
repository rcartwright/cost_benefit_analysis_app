defmodule CostBenefitAnalysisAppWeb.CostControllerTest do
  use CostBenefitAnalysisAppWeb.ConnCase

  alias CostBenefitAnalysisApp.Costs

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:cost) do
    {:ok, cost} = Costs.create_cost(@create_attrs)
    cost
  end

  describe "index" do
    test "lists all costs", %{conn: conn} do
      conn = get conn, cost_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Costs"
    end
  end

  describe "new cost" do
    test "renders form", %{conn: conn} do
      conn = get conn, cost_path(conn, :new)
      assert html_response(conn, 200) =~ "New Cost"
    end
  end

  describe "create cost" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, cost_path(conn, :create), cost: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == cost_path(conn, :show, id)

      conn = get conn, cost_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Cost"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cost_path(conn, :create), cost: @invalid_attrs
      assert html_response(conn, 200) =~ "New Cost"
    end
  end

  describe "edit cost" do
    setup [:create_cost]

    test "renders form for editing chosen cost", %{conn: conn, cost: cost} do
      conn = get conn, cost_path(conn, :edit, cost)
      assert html_response(conn, 200) =~ "Edit Cost"
    end
  end

  describe "update cost" do
    setup [:create_cost]

    test "redirects when data is valid", %{conn: conn, cost: cost} do
      conn = put conn, cost_path(conn, :update, cost), cost: @update_attrs
      assert redirected_to(conn) == cost_path(conn, :show, cost)

      conn = get conn, cost_path(conn, :show, cost)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, cost: cost} do
      conn = put conn, cost_path(conn, :update, cost), cost: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Cost"
    end
  end

  describe "delete cost" do
    setup [:create_cost]

    test "deletes chosen cost", %{conn: conn, cost: cost} do
      conn = delete conn, cost_path(conn, :delete, cost)
      assert redirected_to(conn) == cost_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, cost_path(conn, :show, cost)
      end
    end
  end

  defp create_cost(_) do
    cost = fixture(:cost)
    {:ok, cost: cost}
  end
end
