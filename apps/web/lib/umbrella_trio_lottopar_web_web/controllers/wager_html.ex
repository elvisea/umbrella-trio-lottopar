defmodule UmbrellaTrioLottoparWeb.WagerHTML do
  use UmbrellaTrioLottoparWeb, :html

  embed_templates "wager_html/*"

  @doc """
  Renders a wager form.

  The form is defined in the template at
  wager_html/wager_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def wager_form(assigns)
end
