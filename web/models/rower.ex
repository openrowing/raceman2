defmodule Web.Rower do
  use Web.Web, :model

  schema "rowers" do
    belongs_to :regatta, Web.Regatta
    field :forename, :string
    field :surname, :string
    field :license, :string
    field :year, :integer

    timestamps
  end

  @required_fields ~w(regatta_id)
  @optional_fields ~w(forename surname license year)

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
