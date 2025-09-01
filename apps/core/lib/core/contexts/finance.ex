defmodule Core.Contexts.Finance do
  @moduledoc """
  The Finance context.
  """

  import Ecto.Query, warn: false
  alias Repo.Repo, as: Repo



  @doc """
  Returns the list of wallets.

  ## Examples

      iex> list_wallets()
      [%Repo.Schemas.Finance.Wallet{}, ...]

  """
  def list_wallets do
    Repo.Repo.all(Wallet)
  end

  @doc """
  Gets a single wallet.

  Raises `Ecto.NoResultsError` if the Wallet does not exist.

  ## Examples

      iex> get_wallet!(123)
      %Repo.Schemas.Finance.Wallet{}

      iex> get_wallet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wallet!(id), do: Repo.Repo.get!(Wallet, id)

  @doc """
  Creates a wallet.

  ## Examples

      iex> create_wallet(%{field: value})
      {:ok, %Repo.Schemas.Finance.Wallet{}}

      iex> create_wallet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wallet(attrs) do
    %Repo.Schemas.Finance.Wallet{}
    |> Wallet.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a wallet.

  ## Examples

      iex> update_wallet(wallet, %{field: new_value})
      {:ok, %Repo.Schemas.Finance.Wallet{}}

      iex> update_wallet(wallet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wallet(%Repo.Schemas.Finance.Wallet{} = wallet, attrs) do
    wallet
    |> Wallet.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a wallet.

  ## Examples

      iex> delete_wallet(wallet)
      {:ok, %Repo.Schemas.Finance.Wallet{}}

      iex> delete_wallet(wallet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wallet(%Repo.Schemas.Finance.Wallet{} = wallet) do
    Repo.Repo.delete(wallet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wallet changes.

  ## Examples

      iex> change_wallet(wallet)
      %Ecto.Changeset{data: %Repo.Schemas.Finance.Wallet{}}

  """
  def change_wallet(%Repo.Schemas.Finance.Wallet{} = wallet, attrs \\ %{}) do
    Wallet.changeset(wallet, attrs)
  end



  @doc """
  Returns the list of deposits.

  ## Examples

      iex> list_deposits()
      [%Deposit{}, ...]

  """
  def list_deposits do
    Repo.Repo.all(Deposit)
  end

  @doc """
  Gets a single deposit.

  Raises `Ecto.NoResultsError` if the Deposit does not exist.

  ## Examples

      iex> get_deposit!(123)
      %Deposit{}

      iex> get_deposit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deposit!(id), do: Repo.Repo.get!(Deposit, id)

  @doc """
  Creates a deposit.

  ## Examples

      iex> create_deposit(%{field: value})
      {:ok, %Deposit{}}

      iex> create_deposit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deposit(attrs) do
    %Deposit{}
    |> Deposit.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a deposit.

  ## Examples

      iex> update_deposit(deposit, %{field: new_value})
      {:ok, %Deposit{}}

      iex> update_deposit(deposit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deposit(%Deposit{} = deposit, attrs) do
    deposit
    |> Deposit.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a deposit.

  ## Examples

      iex> delete_deposit(deposit)
      {:ok, %Deposit{}}

      iex> delete_deposit(deposit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deposit(%Deposit{} = deposit) do
    Repo.Repo.delete(deposit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deposit changes.

  ## Examples

      iex> change_deposit(deposit)
      %Ecto.Changeset{data: %Deposit{}}

  """
  def change_deposit(%Deposit{} = deposit, attrs \\ %{}) do
    Deposit.changeset(deposit, attrs)
  end



  @doc """
  Returns the list of withdraws.

  ## Examples

      iex> list_withdraws()
      [%Withdraw{}, ...]

  """
  def list_withdraws do
    Repo.Repo.all(Withdraw)
  end

  @doc """
  Gets a single withdraw.

  Raises `Ecto.NoResultsError` if the Withdraw does not exist.

  ## Examples

      iex> get_withdraw!(123)
      %Withdraw{}

      iex> get_withdraw!(456)
      ** (Ecto.NoResultsError)

  """
  def get_withdraw!(id), do: Repo.Repo.get!(Withdraw, id)

  @doc """
  Creates a withdraw.

  ## Examples

      iex> create_withdraw(%{field: value})
      {:ok, %Withdraw{}}

      iex> create_withdraw(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_withdraw(attrs) do
    %Withdraw{}
    |> Withdraw.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a withdraw.

  ## Examples

      iex> update_withdraw(withdraw, %{field: new_value})
      {:ok, %Withdraw{}}

      iex> update_withdraw(withdraw, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_withdraw(%Withdraw{} = withdraw, attrs) do
    withdraw
    |> Withdraw.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a withdraw.

  ## Examples

      iex> delete_withdraw(withdraw)
      {:ok, %Withdraw{}}

      iex> delete_withdraw(withdraw)
      {:error, %Ecto.Changeset{}}

  """
  def delete_withdraw(%Withdraw{} = withdraw) do
    Repo.Repo.delete(withdraw)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking withdraw changes.

  ## Examples

      iex> change_withdraw(withdraw)
      %Ecto.Changeset{data: %Withdraw{}}

  """
  def change_withdraw(%Withdraw{} = withdraw, attrs \\ %{}) do
    Withdraw.changeset(withdraw, attrs)
  end
end
