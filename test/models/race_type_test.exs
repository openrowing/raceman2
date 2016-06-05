defmodule Web.RaceTypeTest do
  use Web.ModelCase

  alias Web.RaceType

  @valid_attrs %{abbr: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RaceType.changeset(%RaceType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RaceType.changeset(%RaceType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
