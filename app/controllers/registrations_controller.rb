class RegistrationsController < Devise::RegistrationsController
  # allow devise to respond to AJAX calls
  clear_respond_to
  respond_to :json
end
