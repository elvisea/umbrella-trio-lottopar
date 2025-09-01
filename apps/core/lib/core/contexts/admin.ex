defmodule Core.Contexts.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false

  @doc """
  Returns the list of operators.

  ## Examples

      iex> list_operators()
      [%Repo.Schemas.Admin.Operator{}, ...]

  """
  def list_operators do
    Repo.Repo.Repo.all(Repo.Schemas.Admin.Operator)
  end

  @doc """
  Gets a single operator.

  Raises `Ecto.NoResultsError` if the Operator does not exist.

  ## Examples

      iex> get_operator!(123)
      %Repo.Schemas.Admin.Operator{}

      iex> get_operator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_operator!(id), do: Repo.Repo.get!(Repo.Schemas.Admin.Operator, id)

  @doc """
  Creates an operator.

  ## Examples

      iex> create_operator(%{field: value})
      {:ok, %Repo.Schemas.Admin.Operator{}}

      iex> create_operator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_operator(attrs) do
    %Repo.Schemas.Admin.Operator{}
    |> Repo.Schemas.Admin.Operator.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates an operator.

  ## Examples

      iex> update_operator(operator, %{field: new_value})
      {:ok, %Repo.Schemas.Admin.Operator{}}

      iex> update_operator(operator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_operator(%Repo.Schemas.Admin.Operator{} = operator, attrs) do
    operator
    |> Repo.Schemas.Admin.Operator.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes an operator.

  ## Examples

      iex> delete_operator(operator)
      {:ok, %Repo.Schemas.Admin.Operator{}}

      iex> delete_operator(operator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_operator(%Repo.Schemas.Admin.Operator{} = operator) do
    Repo.Repo.delete(operator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking operator changes.

  ## Examples

      iex> change_operator(operator)
      %Ecto.Changeset{data: %Repo.Schemas.Admin.Operator{}}

  """
  def change_operator(%Repo.Schemas.Admin.Operator{} = operator, attrs \\ %{}) do
    Repo.Schemas.Admin.Operator.changeset(operator, attrs)
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
