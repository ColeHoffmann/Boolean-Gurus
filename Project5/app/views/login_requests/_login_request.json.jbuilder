json.extract! login_request, :id, :fname, :lname, :username, :department, :email, :created_at, :updated_at
json.url login_request_url(login_request, format: :json)
