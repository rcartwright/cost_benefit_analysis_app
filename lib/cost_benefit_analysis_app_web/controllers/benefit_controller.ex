defmodule CostBenefitAnalysisAppWeb.BenefitController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Benefits
  alias CostBenefitAnalysisApp.Benefits.Benefit
  alias CostBenefitAnalysisApp.Analyses.Analysis
  alias CostBenefitAnalysisApp.Repo

  def new(conn, %{"plan_id" => plan}) do
    changeset = Benefits.change_benefit(%Benefit{})
    render(conn, "new.html", changeset: changeset, plan: plan)
  end

  def create(conn,%{"benefit" => benefit_params, "plan_id" => plan_id}) do
    plan = Repo.get(Plan, plan_id)
    analysis = Repo.get(Analysis, plan.analysis_id)
    benefit_changeset = Ecto.build_assoc(plan, :benefits, name: benefit_params["name"])

    case Benefits.create_benefit(benefit_changeset) do
      {:ok, benefit} ->
        conn
        |> put_flash(:info, "Benefit created successfully.")
        |> redirect(to: analysis_path(conn, :show, analysis))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    benefit = Benefits.get_benefit!(id)
    {:ok, _benefit} = Benefits.delete_benefit(benefit)

    conn
    |> put_flash(:info, "Benefit deleted successfully.")
    |> redirect(to: plan_benefit_path(conn, :index, benefit))
  end
end
