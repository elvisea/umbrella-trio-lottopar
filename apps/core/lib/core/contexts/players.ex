defmodule Core.Contexts.Players do
  @moduledoc """
  The Players context.
  """

  import Ecto.Query, warn: false
  alias Repo.Repo, as: Repo

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Repo.Schemas.Players.Player{}, ...]

  """
  def list_players do
    Repo.Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Repo.Schemas.Players.Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Repo.Schemas.Players.Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs) do
    %Repo.Schemas.Players.Player{}
    |> Player.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Repo.Schemas.Players.Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Repo.Schemas.Players.Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Repo.Schemas.Players.Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Repo.Schemas.Players.Player{} = player) do
    Repo.Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Repo.Schemas.Players.Player{}}

  """
  def change_player(%Repo.Schemas.Players.Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end
end
