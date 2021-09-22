class UserRoutes < Application
  helpers PaginationLinks

  get '/' do
    'OK'
  end
end
