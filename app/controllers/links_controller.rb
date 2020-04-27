class LinksController < ApiController
  def create
    @resume = Resume.find_by!({
      uuid: params[:resume_id],
      user_id: current_user.id
    })

    @link = Link.new(link_params)
    @link.resume = @resume

    if @link.save
      return render json: @link
    end

    render json: @link.errors, status: :bad_request
  end

  def update
    @link = Link
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    @link.assign_attributes(link_params)

    if @link.save
      return render json: @link
    end

    render json: @link.errors, status: :bad_request
  end

  def destroy
    @link = Link
      .joins(resume: [:user])
      .find_by!({
        resumes: {
          uuid: params[:resume_id],
          user_id: current_user.id
        },
        uuid: params[:id]
      })

    Link.delete(@link.id)
  end

  private

  def link_params
    params
      .permit(:url)
  end
end
