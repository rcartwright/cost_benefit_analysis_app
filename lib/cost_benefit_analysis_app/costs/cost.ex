defmodule CostBenefitAnalysisApp.Costs.Cost do
  use Ecto.Schema
  import Ecto.Changeset


  schema "costs" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(cost, attrs) do
    cost
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
