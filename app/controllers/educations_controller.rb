class EducationsController < ApiController
  before_action :authenticate_user!

  def index
    render json: Education
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

    @education = Education.new(education_params)
    now = Time.now
    @education.start_date = now
    @education.end_date = now
    @education.resume = @resume

    if @education.save
      return render json: @education
    end

    render json: @education.errors, status: :bad_request
  end

  def update
    @education = Education
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    @education.assign_attributes(education_params)

    if @education.save
      return render json: @education
    end

    render json: @education.errors, status: :bad_request
  end

  def destroy
    @education = Education
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    Education.delete(@education.id)
  end

  private

  def education_params
    params
      .permit(:school, :degree, :gpa, :description, :start_date, :end_date)
  end
end
