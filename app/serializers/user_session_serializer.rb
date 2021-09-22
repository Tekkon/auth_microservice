# frozen_string_literal: true
class UserSessionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :uuid,
             :user_id
end
