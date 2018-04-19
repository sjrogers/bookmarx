defmodule Bookmarx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Pbkdf2, as: PwdHashing

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true # for use in auth flow
    field :password_hash, :string

    timestamps()
  end

  @doc """
  hash password if given as plaintext, e.g. in login process
  """
  def changeset(user, %{password: plaintext} = attrs) do
      attrs = attrs |> Map.merge( PwdHashing.add_hash(plaintext) )
#        Map.put_new(attrs, :password_hash, plaintext |> hash_password)
      user
      |> cast(attrs, [:email, :password_hash])
      |> validate_required([:email, :password_hash])
  end

  @doc """
  generated changeset function
  """
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
  end

#  defp auth_changeset(user, %{password: plaintext} = attrs) do
#    hashed = hash_password(plaintext)
#    new_attrs = attrs |> Map.put(:password_hash, hashed)
#    changeset(user, new_attrs)
#  end

#  @doc """
#  authenticate a user with a password
#  """
#  def authenticate(%{email: email, password: plaintext} = attrs) do
#    import Ecto.Query
#    query = from u in "users",
#            where: u.email == ^email,
#            select: u.id
#    user_id = query |> Bookmarx.Repo.one
#    user = Bookmarx.Accounts.get_user!(user_id)
#    password_hash = user.password_hash
#    plaintext
#    |> PwdHashing.checkpw(password_hash)
#  end

#  defp check_password(nil, _), do: {:error, "User not found."}

#  defp check_password(user, plaintext) do
#    result = PwdHashing.checkpw(plaintext, user.password_hash)
#    case result do
#      true -> {:ok, user}
#      false -> {:error, "Credentials do not match any known user."}
#    end
#  end

  @doc """
  hash a password
  """
  def hash_password(plaintext), do: plaintext |> PwdHashing.hashpwsalt
#def hash_password(plaintext) do
  #  def hash_password(changeset) do
#    case changeset do
#      %Ecto.Changeset{valid?: true, changes: %{password: plaintext}} ->
#        hashed = plaintext |> PwdHashing.hashpwsalt
#        put_change(changeset, :password_hash, hashed)
#
#      # if not valid, return without hash
#      _ -> changeset
#    end
#  end
end
