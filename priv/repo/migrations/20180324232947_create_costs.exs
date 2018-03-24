defmodule CostBenefitAnalysisApp.Repo.Migrations.CreateCosts do
  use Ecto.Migration

  def change do
    create table(:costs) do
      add :name, :string

      timestamps()
    end

  end
end
