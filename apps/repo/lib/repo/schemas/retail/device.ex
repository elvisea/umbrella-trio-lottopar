defmodule Repo.Schemas.Retail.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field(:device_type, :string)
    field(:status, :string)
    field(:activation_date, :date)
    field(:last_activity, :naive_datetime)
    field(:serial_number, :string)
    field(:model, :string)
    field(:firmware_version, :string)
    field(:ip_address, :string)
    field(:mac_address, :string)
    field(:location, :string)
    field(:coordinates, :map)

    # Relacionamentos
    field(:retail_id, :string)

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [
      :retail_id,
      :device_type,
      :status,
      :activation_date,
      :last_activity,
      :serial_number,
      :model,
      :firmware_version,
      :ip_address,
      :mac_address,
      :location,
      :coordinates
    ])
    |> validate_required([
      :retail_id,
      :device_type,
      :status,
      :activation_date,
      :last_activity,
      :serial_number,
      :model,
      :firmware_version,
      :ip_address,
      :mac_address,
      :location
    ])
  end
end
