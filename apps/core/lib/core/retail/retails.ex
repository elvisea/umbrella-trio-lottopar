defmodule Core.Retail.Retail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "retails" do
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

    # Relacionamentos
    belongs_to(:operator, Core.Admin.Operator)
    has_many(:devices, Core.Retail.Device)

    timestamps()
  end

  @doc false
  def changeset(retail, attrs) do
    retail
    |> cast(attrs, [
      :operator_id,
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
      :operator_id,
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
