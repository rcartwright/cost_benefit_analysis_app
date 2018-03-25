defmodule CostBenefitAnalysisAppWeb.AnalysisController do
  use CostBenefitAnalysisAppWeb, :controller

  alias CostBenefitAnalysisApp.Analyses
  alias CostBenefitAnalysisApp.Analyses.Analysis

  def index(conn, _params) do
    analyses = Analyses.list_analyses()
    render(conn, "index.html", analyses: analyses)
  end

  def new(conn, _params) do
    changeset = Analyses.change_analysis(%Analysis{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"analysis" => analysis_params}) do
    case Analyses.create_analysis(analysis_params) do
      {:ok, analysis} ->
        conn
        |> put_flash(:info, "Analysis created successfully.")
        |> redirect(to: analysis_path(conn, :show, analysis))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    analysis = Analyses.get_analysis!(id)
    
    render(conn, "show.html", analysis: analysis)
  end

  def edit(conn, %{"id" => id}) do
    analysis = Analyses.get_analysis!(id)
    changeset = Analyses.change_analysis(analysis)
    render(conn, "edit.html", analysis: analysis, changeset: changeset)
  end

  def update(conn, %{"id" => id, "analysis" => analysis_params}) do
    analysis = Analyses.get_analysis!(id)

    case Analyses.update_analysis(analysis, analysis_params) do
      {:ok, analysis} ->
        conn
        |> put_flash(:info, "Analysis updated successfully.")
        |> redirect(to: analysis_path(conn, :show, analysis))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", analysis: analysis, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    analysis = Analyses.get_analysis!(id)
    {:ok, _analysis} = Analyses.delete_analysis(analysis)

    conn
    |> put_flash(:info, "Analysis deleted successfully.")
    |> redirect(to: analysis_path(conn, :index))
  end
end
