defmodule Web.Boat do
  use Web.Web, :model

  schema "boats" do
    belongs_to :event, Web.Event

    has_many :rower_boats, Web.RowerBoat

    field :number, :integer
    field :team_name, :string
    field :disqualified, :string
    field :withdrawn, :boolean, default: false
    field :reregistered, :boolean, default: false
    field :registered_late, :boolean, default: false

    timestamps
  end

  @required_fields ~w(event team_name)
  @optional_fields ~w(number disqualified withdrawn registered_late reregistered)

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
