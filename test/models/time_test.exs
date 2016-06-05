defmodule Web.TimeTest do
  use Web.ModelCase

  alias Web.Time

  @valid_attrs %{measuring_point_id: 42, race_boat_id: 42, time: "14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Time.changeset(%Time{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Time.changeset(%Time{}, @invalid_attrs)
    refute changeset.valid?
  end
end
