defmodule Web.UserController do
  use Web, :controller

  alias Web.Admin, as: CoreAdmin
  alias Web.Admin.User

  def index(conn, _params) do
    users = CoreAdmin.list_users()
    render(conn, :index, users: users)
  end

  def new(conn, _params) do
    changeset = CoreAdmin.change_user(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case CoreAdmin.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: ~p"/admin/users/#{user}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = CoreAdmin.get_user!(id)
    render(conn, :show, user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = CoreAdmin.get_user!(id)
    changeset = CoreAdmin.change_user(user)
    render(conn, :edit, user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = CoreAdmin.get_user!(id)

    case CoreAdmin.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: ~p"/admin/users/#{user}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = CoreAdmin.get_user!(id)
    {:ok, _user} = CoreAdmin.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: ~p"/admin/users")
  end
end
