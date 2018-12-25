class RegistrationsController < Devise::RegistrationsController
  # allow devise to respond to AJAX calls
  respond_to :json
end
