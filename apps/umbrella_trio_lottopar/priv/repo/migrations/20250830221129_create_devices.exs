defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :retail_id, :string
      add :device_type, :string
      add :status, :string
      add :activation_date, :date
      add :last_activity, :naive_datetime
      add :serial_number, :string
      add :model, :string
      add :firmware_version, :string
      add :ip_address, :string
      add :mac_address, :string
      add :location, :string
      add :coordinates, :map

      timestamps()
    end
  end
end
