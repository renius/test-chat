class UsersController < ApplicationController
  skip_before_filter :current_user

  def create
    user = User.create(user_params)
    respond_with user, location: users_path
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
