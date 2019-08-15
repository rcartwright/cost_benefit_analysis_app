defmodule CostBenefitAnalysisApp.Plans.Plan do
  use Ecto.Schema
  import Ecto.Changeset
  alias CostBenefitAnalysisApp.Analyses.Analysis
  alias CostBenefitAnalysisApp.Costs.Cost
  alias CostBenefitAnalysisApp.Benefits.Benefit

  schema "plans" do
    field :name, :string
    belongs_to :analysis, Analysis
    has_many :costs, Cost
    has_many :benefits, Benefit
    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:name])
    #|> cast_assoc(:analysis)
    |> validate_required([:name])
  end
end
