defmodule Web.PlayerHTML do
  use Web, :html

  embed_templates "player_html/*"

  @doc """
  Renders a player form.

  The form is defined in the template at
  player_html/player_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def player_form(assigns)
end
