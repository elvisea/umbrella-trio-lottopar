defmodule UmbrellaTrioLottoparWeb.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :op_id, :string
      add :user_type, :string
      add :status, :string
      add :username, :string
      add :password, :string
      add :otp, :string

      timestamps()
    end
  end
end
