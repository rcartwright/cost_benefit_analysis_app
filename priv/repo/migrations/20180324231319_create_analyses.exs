defmodule CostBenefitAnalysisApp.Repo.Migrations.CreateAnalyses do
  use Ecto.Migration

  def change do
    create table(:analyses) do
      add :name, :string

      timestamps()
    end

  end
end
