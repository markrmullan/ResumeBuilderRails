class CvsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    render json: Cv.where(user_id: current_user.id)
  end

  def create
    @cv = Cv.new(cv_params)
    @cv.user = current_user

    if @cv.save
      return render json: @cv
    else
      return render json: @cv.errors, status: :bad_request
    end
  end

  def update
    @cv = Cv.find_by!(
      uuid: params['id'],
      user_id: current_user.id
    )

    @cv.assign_attributes(cv_params)

    if @cv.save
      return render json: @cv
    else
      return render json: @cv.errors, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: "#{e.message} #{params['id']}" }, status: :not_found
  end

  private

  def cv_params
    params
      .require(:cv)
      .permit(:name)
  end
end
