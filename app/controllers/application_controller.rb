class ApplicationController < ActionController::Base
  respond_to :json
  serialization_scope :view_context

  before_filter :current_user
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: params[:session_token])

    return render json: { errors: [:unautenticated]}, status: 401
  end
end
