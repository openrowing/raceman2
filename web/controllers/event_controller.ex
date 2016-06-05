defmodule Web.EventController do
  use Web.Web, :controller

  import Ecto.Query

  plug :load_regatta

  def index(conn, _params) do
  regatta = conn.assigns[:regatta]
    events = Web.Event
      |> where(regatta_id: ^regatta.id)
      |> order_by([:number, :id])
      |> preload([races: :race_type])
      |> Repo.all

    render conn, "index.html", events: events
  end

  defp load_regatta(conn, _) do
    regatta = Repo.get!(Web.Regatta, conn.params["regatta_id"])
    assign(conn, :regatta, regatta)
  end
end
