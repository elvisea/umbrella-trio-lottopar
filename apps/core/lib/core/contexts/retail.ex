defmodule Core.Contexts.Retail do
  @moduledoc """
  The Retail context.
  """

  import Ecto.Query, warn: false
  alias Repo.Repo, as: Repo


  @doc """
  Returns the list of retails.

  ## Examples

      iex> list_retails()
      [%Repo.Schemas.Retail.Retail{}, ...]

  """
  def list_retails do
    Repo.Repo.all(Retail)
  end

  @doc """
  Gets a single retail.

  Raises `Ecto.NoResultsError` if the Retail does not exist.

  ## Examples

      iex> get_retail!(123)
      %Repo.Schemas.Retail.Retail{}

      iex> get_retail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retail!(id), do: Repo.Repo.get!(Retail, id)

  @doc """
  Creates a retail.

  ## Examples

      iex> create_retail(%{field: value})
      {:ok, %Repo.Schemas.Retail.Retail{}}

      iex> create_retail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retail(attrs) do
    %Repo.Schemas.Retail.Retail{}
    |> Retail.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a retail.

  ## Examples

      iex> update_retail(retail, %{field: new_value})
      {:ok, %Repo.Schemas.Retail.Retail{}}

      iex> update_retail(retail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retail(%Repo.Schemas.Retail.Retail{} = retail, attrs) do
    retail
    |> Retail.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a retail.

  ## Examples

      iex> delete_retail(retail)
      {:ok, %Repo.Schemas.Retail.Retail{}}

      iex> delete_retail(retail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retail(%Repo.Schemas.Retail.Retail{} = retail) do
    Repo.Repo.delete(retail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retail changes.

  ## Examples

      iex> change_retail(retail)
      %Ecto.Changeset{data: %Repo.Schemas.Retail.Retail{}}

  """
  def change_retail(%Repo.Schemas.Retail.Retail{} = retail, attrs \\ %{}) do
    Retail.changeset(retail, attrs)
  end



  @doc """
  Returns the list of devices.

  ## Examples

      iex> list_devices()
      [%Device{}, ...]

  """
  def list_devices do
    Repo.Repo.all(Device)
  end

  @doc """
  Gets a single device.

  Raises `Ecto.NoResultsError` if the Device does not exist.

  ## Examples

      iex> get_device!(123)
      %Device{}

      iex> get_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device!(id), do: Repo.Repo.get!(Device, id)

  @doc """
  Creates a device.

  ## Examples

      iex> create_device(%{field: value})
      {:ok, %Device{}}

      iex> create_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device(attrs) do
    %Device{}
    |> Device.changeset(attrs)
    |> Repo.Repo.insert()
  end

  @doc """
  Updates a device.

  ## Examples

      iex> update_device(device, %{field: new_value})
      {:ok, %Device{}}

      iex> update_device(device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device(%Device{} = device, attrs) do
    device
    |> Device.changeset(attrs)
    |> Repo.Repo.update()
  end

  @doc """
  Deletes a device.

  ## Examples

      iex> delete_device(device)
      {:ok, %Device{}}

      iex> delete_device(device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device(%Device{} = device) do
    Repo.Repo.delete(device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device changes.

  ## Examples

      iex> change_device(device)
      %Ecto.Changeset{data: %Device{}}

  """
  def change_device(%Device{} = device, attrs \\ %{}) do
    Device.changeset(device, attrs)
  end
end
