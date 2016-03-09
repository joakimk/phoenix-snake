defmodule Snake.PageController do
  use Snake.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
