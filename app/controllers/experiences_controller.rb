class ExperiencesController < ApiController
  respond_to :json
  before_action :authenticate_user!

  def index
    render json: Experience
      .joins(resume: [:user])
      .where({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        }
      })
  end

  def create
    @resume = Resume.find_by!({
      uuid: params[:resume_id],
      user_id: current_user.id
    })

    @experience = Experience.new(experience_params)

    now = Time.now
    @experience.start_date = now
    @experience.end_date = now
    @experience.resume = @resume

    if @experience.save
      return render json: @experience
    end

    render json: @experience.errors, status: :bad_request
  end

  def update
    @experience = Experience
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    @experience.assign_attributes(experience_params)

    if @experience.save
      return render json: @experience
    end

    render json: @experience.errors, status: :bad_request
  end

  def destroy
    @experience = Experience
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    Experience.delete(@experience.id)
  end

  private

  def experience_params
    params
      .permit(:company, :position, :location, :description, :start_date, :end_date)
  end
end
