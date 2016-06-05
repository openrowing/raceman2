defmodule Web.RowerBoatTest do
  use Web.ModelCase

  alias Web.RowerBoat

  @valid_attrs %{boat_id: 42, position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RowerBoat.changeset(%RowerBoat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RowerBoat.changeset(%RowerBoat{}, @invalid_attrs)
    refute changeset.valid?
  end
end
