defmodule CostBenefitAnalysisAppWeb.BenefitControllerTest do
  use CostBenefitAnalysisAppWeb.ConnCase

  alias CostBenefitAnalysisApp.Benefits

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:benefit) do
    {:ok, benefit} = Benefits.create_benefit(@create_attrs)
    benefit
  end

  describe "index" do
    test "lists all benefits", %{conn: conn} do
      conn = get conn, benefit_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Benefits"
    end
  end

  describe "new benefit" do
    test "renders form", %{conn: conn} do
      conn = get conn, benefit_path(conn, :new)
      assert html_response(conn, 200) =~ "New Benefit"
    end
  end

  describe "create benefit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, benefit_path(conn, :create), benefit: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == benefit_path(conn, :show, id)

      conn = get conn, benefit_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Benefit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, benefit_path(conn, :create), benefit: @invalid_attrs
      assert html_response(conn, 200) =~ "New Benefit"
    end
  end

  describe "edit benefit" do
    setup [:create_benefit]

    test "renders form for editing chosen benefit", %{conn: conn, benefit: benefit} do
      conn = get conn, benefit_path(conn, :edit, benefit)
      assert html_response(conn, 200) =~ "Edit Benefit"
    end
  end

  describe "update benefit" do
    setup [:create_benefit]

    test "redirects when data is valid", %{conn: conn, benefit: benefit} do
      conn = put conn, benefit_path(conn, :update, benefit), benefit: @update_attrs
      assert redirected_to(conn) == benefit_path(conn, :show, benefit)

      conn = get conn, benefit_path(conn, :show, benefit)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, benefit: benefit} do
      conn = put conn, benefit_path(conn, :update, benefit), benefit: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Benefit"
    end
  end

  describe "delete benefit" do
    setup [:create_benefit]

    test "deletes chosen benefit", %{conn: conn, benefit: benefit} do
      conn = delete conn, benefit_path(conn, :delete, benefit)
      assert redirected_to(conn) == benefit_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, benefit_path(conn, :show, benefit)
      end
    end
  end

  defp create_benefit(_) do
    benefit = fixture(:benefit)
    {:ok, benefit: benefit}
  end
end
