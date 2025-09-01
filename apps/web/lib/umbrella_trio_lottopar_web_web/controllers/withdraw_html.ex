defmodule Web.WithdrawHTML do
  use Web, :html

  embed_templates "withdraw_html/*"

  @doc """
  Renders a withdraw form.

  The form is defined in the template at
  withdraw_html/withdraw_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def withdraw_form(assigns)
end
