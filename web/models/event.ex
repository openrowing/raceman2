defmodule Web.Event do
  use Web.Web, :model

  schema "events" do
    belongs_to :regatta, Web.Regatta

    field :number, :string

    field :name, :string
    field :abbr, :string

    has_many :races, Web.Race

    timestamps
  end

  @required_fields ~w(regatta name abbr)
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
