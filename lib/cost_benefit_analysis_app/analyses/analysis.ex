defmodule CostBenefitAnalysisApp.Analyses.Analysis do
  use Ecto.Schema
  import Ecto.Changeset
  alias CostBenefitAnalysisApp.Plans.Plan

  schema "analyses" do
    field :name, :string
    has_many :plans, CostBenefitAnalysisApp.Plans.Plan
    timestamps()
  end

  @doc false
  def changeset(analysis, attrs) do
    analysis
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
