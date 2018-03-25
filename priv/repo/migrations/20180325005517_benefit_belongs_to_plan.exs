defmodule CostBenefitAnalysisApp.Repo.Migrations.BenefitBelongsToPlan do
  use Ecto.Migration

  def change do
    alter table(:benefits) do
      add :plan_id, references(:plans), null: false
    end
  end
end
