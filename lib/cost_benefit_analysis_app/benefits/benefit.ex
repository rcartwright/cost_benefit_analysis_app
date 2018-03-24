defmodule CostBenefitAnalysisApp.Benefits.Benefit do
  use Ecto.Schema
  import Ecto.Changeset


  schema "benefits" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(benefit, attrs) do
    benefit
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
