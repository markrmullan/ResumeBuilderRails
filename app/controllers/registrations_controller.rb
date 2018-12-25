class RegistrationsController < Devise::RegistrationsController
  # allow devise to respond to and only to application/json request payloads
  clear_respond_to
  respond_to :json
end
