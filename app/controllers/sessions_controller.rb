class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
end
