defmodule Web.RegattaController do
  use Web.Web, :controller

  alias Web.Regatta

  plug :scrub_params, "regatta" when action in [:create, :update]

  def index(conn, _params) do
    regattas = Repo.all(Regatta)
    render(conn, "index.html", regattas: regattas)
  end

  def new(conn, _params) do
    changeset = Regatta.changeset(%Regatta{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"regatta" => regatta_params}) do
    changeset = Regatta.changeset(%Regatta{}, regatta_params)

    case Repo.insert(changeset) do
      {:ok, _regatta} ->
        conn
        |> put_flash(:info, "Regatta created successfully.")
        |> redirect(to: regatta_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regatta = Repo.get!(Regatta, id)
    render(conn, "show.html", regatta: regatta)
  end

  def edit(conn, %{"id" => id}) do
    regatta = Repo.get!(Regatta, id)
    changeset = Regatta.changeset(regatta)
    render(conn, "edit.html", regatta: regatta, changeset: changeset)
  end

  def update(conn, %{"id" => id, "regatta" => regatta_params}) do
    regatta = Repo.get!(Regatta, id)
    changeset = Regatta.changeset(regatta, regatta_params)

    case Repo.update(changeset) do
      {:ok, regatta} ->
        conn
        |> put_flash(:info, "Regatta updated successfully.")
        |> redirect(to: regatta_path(conn, :show, regatta))
      {:error, changeset} ->
        render(conn, "edit.html", regatta: regatta, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regatta = Repo.get!(Regatta, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(regatta)

    conn
    |> put_flash(:info, "Regatta deleted successfully.")
    |> redirect(to: regatta_path(conn, :index))
  end
end
