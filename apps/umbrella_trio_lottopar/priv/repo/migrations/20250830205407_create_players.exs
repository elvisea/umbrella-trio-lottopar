defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :op_id, :string
      add :username, :string
      add :password, :string
      add :status, :string
      add :first_name, :string
      add :last_name, :string
      add :document, :string
      add :birth_date, :date
      add :phone, :string
      add :email, :string
      add :gender, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :zip_code, :string
      add :registration_date, :date
      add :last_login, :naive_datetime

      timestamps()
    end
  end
end
