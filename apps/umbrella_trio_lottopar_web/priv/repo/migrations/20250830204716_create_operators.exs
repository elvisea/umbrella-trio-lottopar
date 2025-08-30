defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateOperators do
  use Ecto.Migration

  def change do
    create table(:operators) do
      add :name, :string
      add :company_name, :string
      add :tax_id, :string
      add :status, :string
      add :country, :string
      add :timezone, :string

      timestamps()
    end
  end
end
