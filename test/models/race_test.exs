defmodule Web.RaceTest do
  use Web.ModelCase

  alias Web.Race

  @valid_attrs %{event_id: 42, number: "some content", race_type_id: 42, scheduled: "2010-04-17 14:00:00", start: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Race.changeset(%Race{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Race.changeset(%Race{}, @invalid_attrs)
    refute changeset.valid?
  end
end
