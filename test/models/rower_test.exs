defmodule Web.RowerTest do
  use Web.ModelCase

  alias Web.Rower

  @valid_attrs %{boat_id: 42, forename: "some content", license: "some content", position: 42, surname: "some content", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rower.changeset(%Rower{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rower.changeset(%Rower{}, @invalid_attrs)
    refute changeset.valid?
  end
end
