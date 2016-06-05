defmodule Web.RaceBoat do
  use Web.Web, :model

  schema "race_boats" do
    belongs_to :race, Web.Race
    belongs_to :boat, Web.Boat

    field :lane_scheduled, :integer
    field :lane_started, :integer
    field :place, :integer

    has_many :times, Web.Time

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w(lane_scheduled lane_started place)

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
