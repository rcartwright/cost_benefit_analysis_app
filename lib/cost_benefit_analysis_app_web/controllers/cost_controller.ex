defmodule CostBenefitAnalysisAppWeb.CostController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Costs
  alias CostBenefitAnalysisApp.Costs.Cost

  def new(conn, %{"plan_id" => plan}) do
    changeset = Costs.change_cost(%Cost{})
    render(conn, "new.html", changeset: changeset, plan: plan)
  end

  def create(conn, %{"cost" => cost_params, "plan_id" => plan_id}) do
    case Costs.create_cost(cost_params) do
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
