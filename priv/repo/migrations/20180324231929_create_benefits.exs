defmodule CostBenefitAnalysisApp.Repo.Migrations.CreateBenefits do
  use Ecto.Migration

  def change do
    create table(:benefits) do
      add :name, :string

      timestamps()
    end

  end
end
