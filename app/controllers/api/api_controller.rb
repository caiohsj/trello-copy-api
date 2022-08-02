class Api::ApiController < ActionController::API
  def authenticate_user_from_token!
    @user_email = request.get_header('HTTP_USER_EMAIL')
    @user_token = request.get_header('HTTP_USER_TOKEN')
    @user = User.find_for_database_authentication(email: @user_email, authentication_token: @user_token)
    render json: {}, status: :unauthorized unless @user.present?
  end

  def current_user
    @user
  end
end
