class ExperiencesController < ApplicationController
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

  private
  def experience_params
    params
      .require(:experience)
      .permit(:company, :position)
  end
end
