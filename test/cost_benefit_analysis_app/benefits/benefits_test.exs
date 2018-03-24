defmodule CostBenefitAnalysisApp.BenefitsTest do
  use CostBenefitAnalysisApp.DataCase

  alias CostBenefitAnalysisApp.Benefits

  describe "benefits" do
    alias CostBenefitAnalysisApp.Benefits.Benefit

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def benefit_fixture(attrs \\ %{}) do
      {:ok, benefit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benefits.create_benefit()

      benefit
    end

    test "list_benefits/0 returns all benefits" do
      benefit = benefit_fixture()
      assert Benefits.list_benefits() == [benefit]
    end

    test "get_benefit!/1 returns the benefit with given id" do
      benefit = benefit_fixture()
      assert Benefits.get_benefit!(benefit.id) == benefit
    end

    test "create_benefit/1 with valid data creates a benefit" do
      assert {:ok, %Benefit{} = benefit} = Benefits.create_benefit(@valid_attrs)
      assert benefit.name == "some name"
    end

    test "create_benefit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benefits.create_benefit(@invalid_attrs)
    end

    test "update_benefit/2 with valid data updates the benefit" do
      benefit = benefit_fixture()
      assert {:ok, benefit} = Benefits.update_benefit(benefit, @update_attrs)
      assert %Benefit{} = benefit
      assert benefit.name == "some updated name"
    end

    test "update_benefit/2 with invalid data returns error changeset" do
      benefit = benefit_fixture()
      assert {:error, %Ecto.Changeset{}} = Benefits.update_benefit(benefit, @invalid_attrs)
      assert benefit == Benefits.get_benefit!(benefit.id)
    end

    test "delete_benefit/1 deletes the benefit" do
      benefit = benefit_fixture()
      assert {:ok, %Benefit{}} = Benefits.delete_benefit(benefit)
      assert_raise Ecto.NoResultsError, fn -> Benefits.get_benefit!(benefit.id) end
    end

    test "change_benefit/1 returns a benefit changeset" do
      benefit = benefit_fixture()
      assert %Ecto.Changeset{} = Benefits.change_benefit(benefit)
    end
  end
end
