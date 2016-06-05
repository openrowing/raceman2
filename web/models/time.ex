defmodule Web.Time do
  use Web.Web, :model

  @primary_key false
  schema "times" do
    belongs_to :race_boat, Web.RaceBoat
    belongs_to :measuring_point, Web.MeasuringPoint

    field :time, Ecto.Time

    timestamps
  end

  @required_fields ~w(race_boat measuring_point time)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
