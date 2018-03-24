defmodule CostBenefitAnalysisAppWeb.PageController do
  use CostBenefitAnalysisAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
