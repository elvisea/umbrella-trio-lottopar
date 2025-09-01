defmodule Web.Retail do
  @moduledoc """
  The Retail context.
  """

  import Ecto.Query, warn: false
  alias UmbrellaTrioLottopar.Repo

  alias Core.Retail.Retail

  @doc """
  Returns the list of retails.

  ## Examples

      iex> list_retails()
      [%Retail{}, ...]

  """
  def list_retails do
    Repo.all(Retail)
  end

  @doc """
  Gets a single retail.

  Raises `Ecto.NoResultsError` if the Retail does not exist.

  ## Examples

      iex> get_retail!(123)
      %Retail{}

      iex> get_retail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retail!(id), do: Repo.get!(Retail, id)

  @doc """
  Creates a retail.

  ## Examples

      iex> create_retail(%{field: value})
      {:ok, %Retail{}}

      iex> create_retail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retail(attrs) do
    %Retail{}
    |> Retail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a retail.

  ## Examples

      iex> update_retail(retail, %{field: new_value})
      {:ok, %Retail{}}

      iex> update_retail(retail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retail(%Retail{} = retail, attrs) do
    retail
    |> Retail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a retail.

  ## Examples

      iex> delete_retail(retail)
      {:ok, %Retail{}}

      iex> delete_retail(retail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retail(%Retail{} = retail) do
    Repo.delete(retail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retail changes.

  ## Examples

      iex> change_retail(retail)
      %Ecto.Changeset{data: %Retail{}}

  """
  def change_retail(%Retail{} = retail, attrs \\ %{}) do
    Retail.changeset(retail, attrs)
  end

  alias Core.Retail.Device

  @doc """
  Returns the list of devices.

  ## Examples

      iex> list_devices()
      [%Device{}, ...]

  """
  def list_devices do
    Repo.all(Device)
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
  def get_device!(id), do: Repo.get!(Device, id)

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
    |> Repo.insert()
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
    |> Repo.update()
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
    Repo.delete(device)
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
