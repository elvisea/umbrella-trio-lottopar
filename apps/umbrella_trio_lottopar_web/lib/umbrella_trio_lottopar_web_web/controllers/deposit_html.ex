defmodule UmbrellaTrioLottoparWeb.DepositHTML do
  use UmbrellaTrioLottoparWeb, :html

  embed_templates "deposit_html/*"

  @doc """
  Renders a deposit form.

  The form is defined in the template at
  deposit_html/deposit_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def deposit_form(assigns)
end
