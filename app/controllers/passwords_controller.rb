class PasswordsController < Devise::PasswordsController
  skip_before_action :verify_authenticity_token
end
