defmodule Web.RaceBoatTest do
  use Web.ModelCase

  alias Web.RaceBoat

  @valid_attrs %{lane: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RaceBoat.changeset(%RaceBoat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RaceBoat.changeset(%RaceBoat{}, @invalid_attrs)
    refute changeset.valid?
  end
end
