defmodule Web.OperatorHTML do
  use Web, :html

  embed_templates "operator_html/*"

  @doc """
  Renders a operator form.

  The form is defined in the template at
  operator_html/operator_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def operator_form(assigns)
end
