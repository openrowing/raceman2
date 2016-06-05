defmodule Web.BoatTest do
  use Web.ModelCase

  alias Web.Boat

  @valid_attrs %{withdrawn: true, disqualified: true, event_id: 42, late_registration: true, number: "some content", regatta_id: 42, team_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Boat.changeset(%Boat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Boat.changeset(%Boat{}, @invalid_attrs)
    refute changeset.valid?
  end
end
