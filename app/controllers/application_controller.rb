class ApplicationController < ActionController::Base
  before_action :restrict_access
  protect_from_forgery with: :exception

  private
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
