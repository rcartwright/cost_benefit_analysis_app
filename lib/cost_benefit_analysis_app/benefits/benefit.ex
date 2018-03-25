defmodule CostBenefitAnalysisApp.Benefits.Benefit do
  use Ecto.Schema
  import Ecto.Changeset
  alias CostBenefitAnalysisApp.Plans.Plan


  schema "benefits" do
    field :name, :string
    belongs_to :plan, Plan
    timestamps()
  end

  @doc false
  def changeset(benefit, attrs) do
    benefit
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
