defmodule CostBenefitAnalysisAppWeb.Router do
  use CostBenefitAnalysisAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CostBenefitAnalysisAppWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AnalysisController, :index
    resources "/analyses", AnalysisController do
      resources "/plans", PlanController,  [:new, :create, :delete, :show, :edit, :update]
    end
    resources "/plans", PlanController do
      resources "/costs", CostController, [:new, :create, :delete]
      resources "/benefits", BenefitController, [:new, :create, :delete]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", CostBenefitAnalysisAppWeb do
  #   pipe_through :api
  # end
end
