class UsersController < ApiController
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

  def user_params
    params
      .permit(:phone_number, :first_name, :last_name)
  end
end
