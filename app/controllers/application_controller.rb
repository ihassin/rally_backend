class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  USER = Rails.env["RALLY_USERNAME"]
  PASSWORD = Rails.env["RALLY_PASSWORD"]

  before_filter :authenticate

  def authenticate
    if %w(test development staging).include? Rails.env
      return true
    end
    authenticate_or_request_with_http_basic do |user_name, password|
      (user_name == USER && password == PASSWORD)
    end
  end
end
