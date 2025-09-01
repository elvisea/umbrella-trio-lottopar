defmodule Web.WalletHTML do
  use Web, :html

  embed_templates "wallet_html/*"

  @doc """
  Renders a wallet form.

  The form is defined in the template at
  wallet_html/wallet_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def wallet_form(assigns)
end
