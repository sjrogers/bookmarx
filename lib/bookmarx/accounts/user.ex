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
      changeset(user, attrs)
  end

  @doc """
  generated changeset function
  """
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
  end

#  @doc """
#  hash a password
#  """
#  def hash_password(plaintext), do: plaintext |> PwdHashing.hashpwsalt
end
