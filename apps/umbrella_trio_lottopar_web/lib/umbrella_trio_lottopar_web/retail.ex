defmodule UmbrellaTrioLottoparWeb.Retail do
  @moduledoc """
  The Retail context.
  """

  import Ecto.Query, warn: false
  alias UmbrellaTrioLottoparWeb.Repo

  alias UmbrellaTrioLottoparWeb.Retail.Retails

  @doc """
  Returns the list of retails.

  ## Examples

      iex> list_retails()
      [%Retails{}, ...]

  """
  def list_retails do
    Repo.all(Retails)
  end

  @doc """
  Gets a single retails.

  Raises `Ecto.NoResultsError` if the Retails does not exist.

  ## Examples

      iex> get_retails!(123)
      %Retails{}

      iex> get_retails!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retails!(id), do: Repo.get!(Retails, id)

  @doc """
  Creates a retails.

  ## Examples

      iex> create_retails(%{field: value})
      {:ok, %Retails{}}

      iex> create_retails(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retails(attrs) do
    %Retails{}
    |> Retails.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a retails.

  ## Examples

      iex> update_retails(retails, %{field: new_value})
      {:ok, %Retails{}}

      iex> update_retails(retails, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retails(%Retails{} = retails, attrs) do
    retails
    |> Retails.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a retails.

  ## Examples

      iex> delete_retails(retails)
      {:ok, %Retails{}}

      iex> delete_retails(retails)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retails(%Retails{} = retails) do
    Repo.delete(retails)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retails changes.

  ## Examples

      iex> change_retails(retails)
      %Ecto.Changeset{data: %Retails{}}

  """
  def change_retails(%Retails{} = retails, attrs \\ %{}) do
    Retails.changeset(retails, attrs)
  end

  alias UmbrellaTrioLottoparWeb.Retail.Device

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
