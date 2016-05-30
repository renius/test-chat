class SessionsController < ApplicationController
  skip_before_filter :current_user

  def create
    user = User.authorize(user_params)

    return render json: { errors: ['name or password invalid']}, status: 401 unless user

    respond_with user, location: sessions_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
