defmodule CostBenefitAnalysisAppWeb.BenefitController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Benefits
  alias CostBenefitAnalysisApp.Benefits.Benefit

  def new(conn, _params) do
    changeset = Benefits.change_benefit(%Benefit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"benefit" => benefit_params}) do
    case Benefits.create_benefit(benefit_params) do
      {:ok, benefit} ->
        conn
        |> put_flash(:info, "Benefit created successfully.")
        |> redirect(to: benefit_path(conn, :show, benefit))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    benefit = Benefits.get_benefit!(id)
    {:ok, _benefit} = Benefits.delete_benefit(benefit)

    conn
    |> put_flash(:info, "Benefit deleted successfully.")
    |> redirect(to: benefit_path(conn, :index))
  end
end
