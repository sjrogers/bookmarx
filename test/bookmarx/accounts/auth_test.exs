defmodule Bookmarx.AuthTest do
  use Bookmarx.DataCase

  alias Bookmarx.Accounts

  describe "auth" do
    alias Bookmarx.Accounts

    @user_email "newguy@nowhe.re"
    @correct_password "unencrypted"
    @incorrect_password "script_kiddie"
    @valid_attrs %{email: @user_email, password: @correct_password}
    @invalid_attrs %{email: @user_email, password: @incorrect_password}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} = Accounts.create_user(@valid_attrs)
      user
    end

    test "guardian identifies user correctly" do
      alias Bookmarx.Auth.Guardian
      user = user_fixture()
      empty_claims = []
      expected = {:ok, to_string(user.id)}

      {:ok, sub} =
        user
        |> Guardian.subject_for_token(empty_claims)

      assert {:ok, user} == Guardian.resource_from_claims(%{"sub": sub})
    end

    test "user authenticates with correct password" do
      user = user_fixture()
      assert {:ok, user} == Accounts.authenticate_user(@valid_attrs)
    end

    test "user fails to authenticate with incorrect password" do
      user_fixture()
      assert {:error, :invalid_credentials} == Accounts.authenticate_user(@invalid_attrs)
    end
  end
end
