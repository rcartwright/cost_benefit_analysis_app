defmodule CostBenefitAnalysisAppWeb.CostController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Costs
  alias CostBenefitAnalysisApp.Costs.Cost
  alias CostBenefitAnalysisApp.Plans.Plan
  alias CostBenefitAnalysisApp.Repo

  def new(conn, %{"plan_id" => plan}) do
    changeset = Costs.change_cost(%Cost{})
    render(conn, "new.html", changeset: changeset, plan: plan)
  end

  def create(conn, %{"cost" => cost_params, "plan_id" => plan_id}) do
    plan = Repo.get(Plan, plan_id)
    cost_changeset = Ecto.build_assoc(plan, :costs, name: cost_params["name"])

    case Repo.insert(cost_changeset) do
      {:ok, cost} ->
        conn
        |> put_flash(:info, "Cost created successfully.")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cost = Costs.get_cost!(id)
    {:ok, _cost} = Costs.delete_cost(cost)

    conn
    |> put_flash(:info, "Cost deleted successfully.")
  end
end
