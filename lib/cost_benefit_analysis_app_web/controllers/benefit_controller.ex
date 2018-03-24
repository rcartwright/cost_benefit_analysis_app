defmodule CostBenefitAnalysisAppWeb.BenefitController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Benefits
  alias CostBenefitAnalysisApp.Benefits.Benefit

  def index(conn, _params) do
    benefits = Benefits.list_benefits()
    render(conn, "index.html", benefits: benefits)
  end

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

  def show(conn, %{"id" => id}) do
    benefit = Benefits.get_benefit!(id)
    render(conn, "show.html", benefit: benefit)
  end

  def edit(conn, %{"id" => id}) do
    benefit = Benefits.get_benefit!(id)
    changeset = Benefits.change_benefit(benefit)
    render(conn, "edit.html", benefit: benefit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "benefit" => benefit_params}) do
    benefit = Benefits.get_benefit!(id)

    case Benefits.update_benefit(benefit, benefit_params) do
      {:ok, benefit} ->
        conn
        |> put_flash(:info, "Benefit updated successfully.")
        |> redirect(to: benefit_path(conn, :show, benefit))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", benefit: benefit, changeset: changeset)
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
