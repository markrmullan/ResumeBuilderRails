class UsersController < ApiController
  before_action :authenticate_user!, except: :show

  def index
    return unauthorized unless current_user.is_admin?

    render json: User.all
  end

  def show
    render json: current_user
  end

  def update
    @user = User.find_by!(id: current_user.id)

    @user.assign_attributes(user_params)

    if @user.save
      return render json: @user
    end

    render json: @user.errors, status: :bad_request
  end

  ###
  ### GOD MODE BECOME ANY USER BY USER ID, ONLY WORKS FROM mark@easy-resu.me
  ###
  ### fetch('http://localhost:3001/users/dab5a0c5-d96b-42e3-a01f-0d8bd3a09c1e/become', { method: 'POST', credentials: 'include'})
  ### fetch('https://api.easy-resu.me/users/57814c85-eb7e-4b4c-9974-c3c5a0088d28/become', { method: 'POST', credentials: 'include'})
  ###
  def become
    return unless current_user.is_admin?
    sign_in(User.find_by!(uuid: params[:id]))
    redirect_to root_url
  end

  def user_params
    params
      .permit(:phone_number, :first_name, :last_name, :resume_email, :city, :state, :zip, :job_title)
  end
end
