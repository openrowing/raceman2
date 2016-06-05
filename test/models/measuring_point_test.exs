defmodule Web.MeasuringPointTest do
  use Web.ModelCase

  alias Web.MeasuringPoint

  @valid_attrs %{position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MeasuringPoint.changeset(%MeasuringPoint{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MeasuringPoint.changeset(%MeasuringPoint{}, @invalid_attrs)
    refute changeset.valid?
  end
end
