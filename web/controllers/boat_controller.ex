defmodule Web.BoatController do
  use Web.Web, :controller

  import Ecto.Query

  plug :load_event

  def index(conn, _params) do
    event = conn.assigns[:event]

    rower_boats_query = from r in Web.RowerBoat, order_by: r.position, preload: :rower

    boats = Web.Boat
      |> where(event_id: ^event.id)
      |> order_by([:number, :id])
      |> preload([rower_boats: ^rower_boats_query])
      |> Repo.all

    render conn, "index.html", boats: boats
  end

  defp load_event(conn, _) do
    event = Repo.get!(Web.Event, conn.params["event_id"])
    conn
    |> assign(:event, event)
  end
end
