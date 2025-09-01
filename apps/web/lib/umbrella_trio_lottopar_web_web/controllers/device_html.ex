defmodule Web.DeviceHTML do
  use Web, :html

  embed_templates "device_html/*"

  @doc """
  Renders a device form.

  The form is defined in the template at
  device_html/device_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def device_form(assigns)
end
