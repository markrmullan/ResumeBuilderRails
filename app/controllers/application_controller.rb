class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # originally for Devise, but we want to allow all APIs to respond to, and only to, application/json requests
  clear_respond_to
  respond_to :json
end
