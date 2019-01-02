class ExperiencesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    if @experience.save
      return render :json => @experience
    else
      return render :json => @experience.errors, status: :bad_request
    end
  end

  def update
    @experience = Experience.find_by!({
      uuid: params['id'],
      user_id: current_user.id
    })

    @experience.assign_attributes(experience_params)

    if @experience.save
      return render :json => @experience
    else
      return render :json => @experience.errors, status: :bad_request
    end

  rescue ActiveRecord::RecordNotFound => e
    return render json: { message: "#{e.message} #{params['id']}" }, status: :not_found
  end

  private
  def experience_params
    params
      .require(:experience)
      .permit(:company, :position)
  end
end
