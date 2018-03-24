defmodule CostBenefitAnalysisApp.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :name, :string

      timestamps()
    end

  end
end
