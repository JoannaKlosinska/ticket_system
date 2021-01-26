class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :login
  
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id })
      json_response(token) # render json: { token: token }, status: :ok
    else
      unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
