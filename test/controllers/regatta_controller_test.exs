defmodule Web.RegattaControllerTest do
  use Web.ConnCase

  alias Web.Regatta
  @valid_attrs %{from: "2010-04-17", name: "some content", to: "2010-04-17"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, regatta_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing regattas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, regatta_path(conn, :new)
    assert html_response(conn, 200) =~ "New regatta"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, regatta_path(conn, :create), regatta: @valid_attrs
    assert redirected_to(conn) == regatta_path(conn, :index)
    assert Repo.get_by(Regatta, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, regatta_path(conn, :create), regatta: @invalid_attrs
    assert html_response(conn, 200) =~ "New regatta"
  end

  test "shows chosen resource", %{conn: conn} do
    regatta = Repo.insert! %Regatta{}
    conn = get conn, regatta_path(conn, :show, regatta)
    assert html_response(conn, 200) =~ "Show regatta"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, regatta_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    regatta = Repo.insert! %Regatta{}
    conn = get conn, regatta_path(conn, :edit, regatta)
    assert html_response(conn, 200) =~ "Edit regatta"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    regatta = Repo.insert! %Regatta{}
    conn = put conn, regatta_path(conn, :update, regatta), regatta: @valid_attrs
    assert redirected_to(conn) == regatta_path(conn, :show, regatta)
    assert Repo.get_by(Regatta, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    regatta = Repo.insert! %Regatta{}
    conn = put conn, regatta_path(conn, :update, regatta), regatta: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit regatta"
  end

  test "deletes chosen resource", %{conn: conn} do
    regatta = Repo.insert! %Regatta{}
    conn = delete conn, regatta_path(conn, :delete, regatta)
    assert redirected_to(conn) == regatta_path(conn, :index)
    refute Repo.get(Regatta, regatta.id)
  end
end
