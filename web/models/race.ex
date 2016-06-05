defmodule Web.Race do
  use Web.Web, :model

  schema "races" do
    belongs_to :race_type, Web.RaceType
    belongs_to :event, Web.Event

    field :number, :string

    field :scheduled, Ecto.DateTime
    field :started, Ecto.DateTime

    has_many :race_boats, Web.RaceBoat

    timestamps
  end

  @required_fields ~w(race_type_id event_id)
  @optional_fields ~w(scheduled started)

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
