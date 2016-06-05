defmodule Web.RaceController do
  use Web.Web, :controller

  import Ecto.Query

  def show(conn, %{"id" => id}) do

    race = Web.Race
      |> Repo.get!(id)
      |> Repo.preload([:race_type])

    rower_boats_query = from r in Web.RowerBoat, order_by: r.position, preload: :rower
    times_query = from t in Web.Time, join: mp in assoc(t, :measuring_point), order_by: mp.position, preload: [:measuring_point]

    race_boats = Web.RaceBoat
      |> where(race_id: ^race.id)
      |> order_by([:place, :lane_started, :lane_scheduled])
      |> preload([times: ^times_query, boat: [rower_boats: ^rower_boats_query]])
      |> Repo.all

    render conn, "show.html", race: race, race_boats: race_boats
  end

end
