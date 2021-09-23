class AuthRoutes < Application
  helpers Auth

  namespace '/v1' do
    post '/auth' do
      result = Auth::FetchUserService.call(extracted_token['uuid'])

      if result.success?
        meta = { user_id: result.user.id }

        status 200
        json meta: meta
      else
        status 403
        error_response(result.errors)
      end
    end

    post '/signup' do
      user_params = validate_with!(UserParamsContract)

      result = Users::CreateService.call(*user_params.to_h.values)

      if result.success?
        status 201
      else
        error_response(result.user || result.errors)
      end
    end

    post '/login' do
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
end
