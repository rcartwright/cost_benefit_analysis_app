defmodule CostBenefitAnalysisApp.Repo.Migrations.CostBelongsToPlan do
  use Ecto.Migration

  def change do
    alter table(:costs) do
      add :plan_id, references(:plans), null: false
    end
  end
end
