class ApplicationController < ActionController::API
  def sign_in
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: 'Sign-in successful!' }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def sign_out
    session.delete(:user_id)
    render json: { message: 'Sign-out successful!' }, status: :ok
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    unless current_user
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end
end
