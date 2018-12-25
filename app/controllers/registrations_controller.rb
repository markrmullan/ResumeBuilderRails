class RegistrationsController < Devise::RegistrationsController
  # devise by default disallows some operations (sign up, login) if the user already has an active session.
  # this line removes that default constraint
  skip_before_action :require_no_authentication
end
