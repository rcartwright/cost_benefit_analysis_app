defmodule CostBenefitAnalysisApp.Benefits do
  @moduledoc """
  The Benefits context.
  """

  import Ecto.Query, warn: false
  alias CostBenefitAnalysisApp.Repo

  alias CostBenefitAnalysisApp.Benefits.Benefit

  @doc """
  Returns the list of benefits.

  ## Examples

      iex> list_benefits()
      [%Benefit{}, ...]

  """
  def list_benefits do
    Repo.all(Benefit)
  end

  @doc """
  Gets a single benefit.

  Raises `Ecto.NoResultsError` if the Benefit does not exist.

  ## Examples

      iex> get_benefit!(123)
      %Benefit{}

      iex> get_benefit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_benefit!(id), do: Repo.get!(Benefit, id)

  @doc """
  Creates a benefit.

  ## Examples

      iex> create_benefit(%{field: value})
      {:ok, %Benefit{}}

      iex> create_benefit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_benefit(attrs \\ %{}) do
    %Benefit{}
    |> Benefit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a benefit.

  ## Examples

      iex> update_benefit(benefit, %{field: new_value})
      {:ok, %Benefit{}}

      iex> update_benefit(benefit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_benefit(%Benefit{} = benefit, attrs) do
    benefit
    |> Benefit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Benefit.

  ## Examples

      iex> delete_benefit(benefit)
      {:ok, %Benefit{}}

      iex> delete_benefit(benefit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_benefit(%Benefit{} = benefit) do
    Repo.delete(benefit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking benefit changes.

  ## Examples

      iex> change_benefit(benefit)
      %Ecto.Changeset{source: %Benefit{}}

  """
  def change_benefit(%Benefit{} = benefit) do
    Benefit.changeset(benefit, %{})
  end
end
