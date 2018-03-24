defmodule CostBenefitAnalysisApp.Costs do
  @moduledoc """
  The Costs context.
  """

  import Ecto.Query, warn: false
  alias CostBenefitAnalysisApp.Repo

  alias CostBenefitAnalysisApp.Costs.Cost

  @doc """
  Returns the list of costs.

  ## Examples

      iex> list_costs()
      [%Cost{}, ...]

  """
  def list_costs do
    Repo.all(Cost)
  end

  @doc """
  Gets a single cost.

  Raises `Ecto.NoResultsError` if the Cost does not exist.

  ## Examples

      iex> get_cost!(123)
      %Cost{}

      iex> get_cost!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cost!(id), do: Repo.get!(Cost, id)

  @doc """
  Creates a cost.

  ## Examples

      iex> create_cost(%{field: value})
      {:ok, %Cost{}}

      iex> create_cost(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cost(attrs \\ %{}) do
    %Cost{}
    |> Cost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cost.

  ## Examples

      iex> update_cost(cost, %{field: new_value})
      {:ok, %Cost{}}

      iex> update_cost(cost, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cost(%Cost{} = cost, attrs) do
    cost
    |> Cost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cost.

  ## Examples

      iex> delete_cost(cost)
      {:ok, %Cost{}}

      iex> delete_cost(cost)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cost(%Cost{} = cost) do
    Repo.delete(cost)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cost changes.

  ## Examples

      iex> change_cost(cost)
      %Ecto.Changeset{source: %Cost{}}

  """
  def change_cost(%Cost{} = cost) do
    Cost.changeset(cost, %{})
  end
end
