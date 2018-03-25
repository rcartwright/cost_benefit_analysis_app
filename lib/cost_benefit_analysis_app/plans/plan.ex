defmodule CostBenefitAnalysisApp.Plans.Plan do
  use Ecto.Schema
  import Ecto.Changeset
  alias CostBenefitAnalysisApp.Analyses.Analysis

  schema "plans" do
    field :name, :string
    belongs_to :analysis, Analysis
    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
