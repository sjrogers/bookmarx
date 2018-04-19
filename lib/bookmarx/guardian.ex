defmodule Bookmarx.Auth.Guardian do
  @moduledoc false
#  use Guardian, otp_app: :bookmarx

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    # TODO: get_resource_by_id
#    resource = Bookmarx.get_resource_by_id(id)
    {resource, _} = {true, id}
    {:ok, resource}
  end
end
