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

    test "user authenticates with correct password" do
      user_fixture()
      assert Accounts.authenticate_user(@valid_attrs)
    end

    test "user fails to authenticate with incorrect password" do
      user_fixture()
      authenticates? = Accounts.authenticate_user(@invalid_attrs)
      assert authenticates? == false
    end
  end
end
