defmodule CostBenefitAnalysisAppWeb.CostController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Costs
  alias CostBenefitAnalysisApp.Costs.Cost

  def index(conn, _params) do
    costs = Costs.list_costs()
    render(conn, "index.html", costs: costs)
  end

  def new(conn, _params) do
    changeset = Costs.change_cost(%Cost{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cost" => cost_params}) do
    case Costs.create_cost(cost_params) do
      {:ok, cost} ->
        conn
        |> put_flash(:info, "Cost created successfully.")
        |> redirect(to: cost_path(conn, :show, cost))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cost = Costs.get_cost!(id)
    render(conn, "show.html", cost: cost)
  end

  def edit(conn, %{"id" => id}) do
    cost = Costs.get_cost!(id)
    changeset = Costs.change_cost(cost)
    render(conn, "edit.html", cost: cost, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cost" => cost_params}) do
    cost = Costs.get_cost!(id)

    case Costs.update_cost(cost, cost_params) do
      {:ok, cost} ->
        conn
        |> put_flash(:info, "Cost updated successfully.")
        |> redirect(to: cost_path(conn, :show, cost))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cost: cost, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cost = Costs.get_cost!(id)
    {:ok, _cost} = Costs.delete_cost(cost)

    conn
    |> put_flash(:info, "Cost deleted successfully.")
    |> redirect(to: cost_path(conn, :index))
  end
end
