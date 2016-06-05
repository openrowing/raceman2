defmodule Web.PageController do
  use Web.Web, :controller

  def index(conn, _params) do
    regattas = Repo.all(Web.Regatta)

    render conn, "index.html", regattas: regattas
  end
end
