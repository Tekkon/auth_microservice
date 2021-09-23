class UserSessionRoutes < Application
  post '/v1/login' do
    session_params = validate_with!(SessionParamsContract)

    result = UserSessions::CreateService.call(*session_params.to_h.values)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)
      meta = { token: token }

      status 201
      json meta: meta
    else
      error_response(result.session || result.errors)
    end
  end
end
