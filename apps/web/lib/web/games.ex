defmodule UmbrellaTrioLottoparWeb.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias UmbrellaTrioLottoparWeb.Repo

  alias UmbrellaTrioLottoparWeb.Games.Wager

  @doc """
  Returns the list of wagers.

  ## Examples

      iex> list_wagers()
      [%Wager{}, ...]

  """
  def list_wagers do
    Repo.all(Wager)
  end

  @doc """
  Gets a single wager.

  Raises `Ecto.NoResultsError` if the Wager does not exist.

  ## Examples

      iex> get_wager!(123)
      %Wager{}

      iex> get_wager!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wager!(id), do: Repo.get!(Wager, id)

  @doc """
  Creates a wager.

  ## Examples

      iex> create_wager(%{field: value})
      {:ok, %Wager{}}

      iex> create_wager(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wager(attrs) do
    %Wager{}
    |> Wager.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wager.

  ## Examples

      iex> update_wager(wager, %{field: new_value})
      {:ok, %Wager{}}

      iex> update_wager(wager, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wager(%Wager{} = wager, attrs) do
    wager
    |> Wager.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wager.

  ## Examples

      iex> delete_wager(wager)
      {:ok, %Wager{}}

      iex> delete_wager(wager)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wager(%Wager{} = wager) do
    Repo.delete(wager)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wager changes.

  ## Examples

      iex> change_wager(wager)
      %Ecto.Changeset{data: %Wager{}}

  """
  def change_wager(%Wager{} = wager, attrs \\ %{}) do
    Wager.changeset(wager, attrs)
  end
end
