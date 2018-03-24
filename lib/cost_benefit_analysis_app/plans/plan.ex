defmodule CostBenefitAnalysisApp.Plans.Plan do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plans" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
