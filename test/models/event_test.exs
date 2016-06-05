defmodule Web.EventTest do
  use Web.ModelCase

  alias Web.Event

  @valid_attrs %{abbr: "some content", name: "some content", regatta_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
