defmodule CostBenefitAnalysisApp.Repo.Migrations.PlanBelongsToAnalysis do
  use Ecto.Migration

  def change do
    alter table(:plans) do
      add :analysis_id, references(:analyses), null: false
    end
  end
end
