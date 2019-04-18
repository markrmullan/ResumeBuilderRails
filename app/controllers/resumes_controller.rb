class ResumesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    render json: Resume.where(user_id: current_user.id)
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user

    if @resume.save
      return render json: @resume
    else
      return render json: @resume.errors, status: :bad_request
    end
  end

  def update
    @resume = Resume.find_by!(
      uuid: params['id'],
      user_id: current_user.id
    )

    @resume.assign_attributes(resume_params)

    if @resume.save
      return render json: @resume
    else
      return render json: @resume.errors, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: "#{e.message} #{params['id']}" }, status: :not_found
  end

  private

  def resume_params
    params
      .require(:resume)
      .permit(:name)
  end
end
