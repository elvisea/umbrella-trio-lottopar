defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateRetails do
  use Ecto.Migration

  def change do
    create table(:retails) do
      add :op_id, :string
      add :name, :string
      add :tax_id, :string
      add :status, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :zip_code, :string
      add :phone, :string
      add :email, :string
      add :manager_name, :string

      timestamps()
    end
  end
end
