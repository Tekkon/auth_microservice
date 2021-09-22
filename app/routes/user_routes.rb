class UserRoutes < Application
  helpers PaginationLinks

  namespace '/v1' do
    get do
      'OK'
    end
  end
end
