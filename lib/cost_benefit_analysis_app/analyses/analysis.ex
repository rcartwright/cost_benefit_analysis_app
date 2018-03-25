defmodule CostBenefitAnalysisApp.Analyses.Analysis do
  use Ecto.Schema
  import Ecto.Changeset

  schema "analyses" do
    field :name, :string
    timestamps()
  end

  @doc false
  def changeset(analysis, attrs) do
    analysis
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
