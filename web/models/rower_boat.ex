defmodule Web.RowerBoat do
  use Web.Web, :model

  @primary_key false
  schema "rower_boats" do
    belongs_to :boat, Web.Boat
    belongs_to :rower, Web.Rower

    field :position, :integer

    timestamps
  end

  @required_fields ~w(boat_id position)
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
