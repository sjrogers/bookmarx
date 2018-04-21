defmodule Bookmarx.Auth.Guardian do
  @moduledoc false
  use Guardian, otp_app: :bookmarx

  alias Bookmarx.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub": id}) do
    user = Accounts.get_user!(id)
    if user != nil, do: {:ok, user}, else: {:error, :resource_not_found}
  end
end
