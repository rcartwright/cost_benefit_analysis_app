defmodule CostBenefitAnalysisApp.Costs.Cost do
  use Ecto.Schema
  import Ecto.Changeset
  alias CostBenefitAnalysisApp.Plans.Plan


  schema "costs" do
    field :name, :string
    belongs_to :plan, Plan
    timestamps()
  end

  @doc false
  def changeset(cost, attrs) do
    cost
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
