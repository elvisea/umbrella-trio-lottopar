defmodule UmbrellaTrioLottoparWeb.Retail.Retails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "retails" do
    field(:op_id, :string)
    field(:name, :string)
    field(:tax_id, :string)
    field(:status, :string)
    field(:address, :string)
    field(:city, :string)
    field(:state, :string)
    field(:country, :string)
    field(:zip_code, :string)
    field(:phone, :string)
    field(:email, :string)
    field(:manager_name, :string)

    timestamps()
  end

  @doc false
  def changeset(retails, attrs) do
    retails
    |> cast(attrs, [
      :op_id,
      :name,
      :tax_id,
      :status,
      :address,
      :city,
      :state,
      :country,
      :zip_code,
      :phone,
      :email,
      :manager_name
    ])
    |> validate_required([
      :op_id,
      :name,
      :tax_id,
      :status,
      :address,
      :city,
      :state,
      :country,
      :zip_code,
      :phone,
      :email,
      :manager_name
    ])
  end
end
