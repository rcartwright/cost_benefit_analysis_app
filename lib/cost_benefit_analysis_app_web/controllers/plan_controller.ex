defmodule CostBenefitAnalysisAppWeb.PlanController do
  use CostBenefitAnalysisAppWeb, :controller
  

  alias CostBenefitAnalysisApp.Plans
  alias CostBenefitAnalysisApp.Plans.Plan
  alias CostBenefitAnalysisApp.Repo
  alias CostBenefitAnalysisApp.Analyses.Analysis


  def new(conn,  %{"analysis_id" => analysis}) do
    changeset = Plans.change_plan(%Plan{})
    render(conn, "new.html", changeset: changeset, analysis: analysis)
  end

  def create(conn, %{"plan" => plan_params, "analysis_id" => analysis_id}) do
   analysis = Repo.get(Analysis, analysis_id)
   plan_changeset = Ecto.build_assoc(analysis, :plans, name: plan_params["name"])

    case Repo.insert(plan_changeset) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan created successfully.")
        |> redirect(to: analysis_plan_path(conn, :show, plan))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan = Plans.get_plan!(id)
    render(conn, "show.html", plan: plan)
  end

  def edit(conn, %{"id" => id}) do
    plan = Plans.get_plan!(id)
    changeset = Plans.change_plan(plan)
    render(conn, "edit.html", plan: plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan" => plan_params}) do
    plan = Plans.get_plan!(id)
    analysis = Repo.get(Analysis, plan.analysis_id)

    case Plans.update_plan(plan, plan_params) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan updated successfully.")
        |> redirect(to: analysis_path(conn, :show, analysis))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plan: plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan = Plans.get_plan!(id)
    {:ok, _plan} = Plans.delete_plan(plan)

    conn
    |> put_flash(:info, "Plan deleted successfully.")
  end
end
