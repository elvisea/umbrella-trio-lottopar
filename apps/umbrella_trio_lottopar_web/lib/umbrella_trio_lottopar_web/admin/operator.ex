defmodule UmbrellaTrioLottoparWeb.Admin.Operator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "operators" do
    field(:name, :string)
    field(:company_name, :string)
    field(:tax_id, :string)
    field(:status, :string)
    field(:country, :string)
    field(:timezone, :string)

    timestamps()
  end

  @doc false
  def changeset(operator, attrs) do
    operator
    |> cast(attrs, [:name, :company_name, :tax_id, :status, :country, :timezone])
    |> validate_required([:name, :company_name, :tax_id, :status, :country, :timezone])
  end
end
