class ResumesController < ApiController
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

  def show
    @resume = Resume
      .includes(:experiences)
      .find_by!(
        uuid: params['id'],
        user_id: current_user.id
      )

    render json: @resume
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
  end

  private

  def resume_params
    params
      .require(:resume)
      .permit(:name)
  end
end
