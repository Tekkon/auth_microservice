class UserRoutes < Application
  helpers PaginationLinks

  post '/v1/signup' do
    user_params = validate_with!(UserParamsContract)

    result = Users::CreateService.call(*user_params.to_h.values)

    if result.success?
      status 201
    else
      error_response(result.user || result.errors)
    end
  end
end
