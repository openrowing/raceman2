defmodule Web.RegattaTest do
  use Web.ModelCase

  alias Web.Regatta

  @valid_attrs %{from: "2010-04-17", name: "some content", to: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Regatta.changeset(%Regatta{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Regatta.changeset(%Regatta{}, @invalid_attrs)
    refute changeset.valid?
  end
end
