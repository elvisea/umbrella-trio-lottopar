defmodule UmbrellaTrioLottoparWeb.PageController do
  use UmbrellaTrioLottoparWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
