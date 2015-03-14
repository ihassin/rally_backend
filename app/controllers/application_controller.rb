class ApplicationController < ActionController::Base
  protect_from_forgery
  
  USER = "your_auth_username"
  PASSWORD = "your_auth_password"

  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      (user_name == USER && password == PASSWORD)
    end
  end
end
