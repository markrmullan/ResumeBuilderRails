class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # Use Mongoid::Errors::DocumentNotFound with mongoid

  def not_found
    render json: {
      error: {
        message: "Not Found",
        code: "NOT_FOUND",
        status: 404
      }
    }, status: :bad_request
  end
end
