defmodule CostBenefitAnalysisApp.CostsTest do
  use CostBenefitAnalysisApp.DataCase

  alias CostBenefitAnalysisApp.Costs

  describe "costs" do
    alias CostBenefitAnalysisApp.Costs.Cost

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def cost_fixture(attrs \\ %{}) do
      {:ok, cost} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Costs.create_cost()

      cost
    end

    test "list_costs/0 returns all costs" do
      cost = cost_fixture()
      assert Costs.list_costs() == [cost]
    end

    test "get_cost!/1 returns the cost with given id" do
      cost = cost_fixture()
      assert Costs.get_cost!(cost.id) == cost
    end

    test "create_cost/1 with valid data creates a cost" do
      assert {:ok, %Cost{} = cost} = Costs.create_cost(@valid_attrs)
      assert cost.name == "some name"
    end

    test "create_cost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Costs.create_cost(@invalid_attrs)
    end

    test "update_cost/2 with valid data updates the cost" do
      cost = cost_fixture()
      assert {:ok, cost} = Costs.update_cost(cost, @update_attrs)
      assert %Cost{} = cost
      assert cost.name == "some updated name"
    end

    test "update_cost/2 with invalid data returns error changeset" do
      cost = cost_fixture()
      assert {:error, %Ecto.Changeset{}} = Costs.update_cost(cost, @invalid_attrs)
      assert cost == Costs.get_cost!(cost.id)
    end

    test "delete_cost/1 deletes the cost" do
      cost = cost_fixture()
      assert {:ok, %Cost{}} = Costs.delete_cost(cost)
      assert_raise Ecto.NoResultsError, fn -> Costs.get_cost!(cost.id) end
    end

    test "change_cost/1 returns a cost changeset" do
      cost = cost_fixture()
      assert %Ecto.Changeset{} = Costs.change_cost(cost)
    end
  end
end
