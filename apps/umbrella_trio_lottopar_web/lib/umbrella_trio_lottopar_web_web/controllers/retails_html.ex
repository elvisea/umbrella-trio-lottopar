defmodule UmbrellaTrioLottoparWeb.RetailsHTML do
  use UmbrellaTrioLottoparWeb, :html

  embed_templates "retails_html/*"

  @doc """
  Renders a retails form.

  The form is defined in the template at
  retails_html/retails_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def retails_form(assigns)
end
