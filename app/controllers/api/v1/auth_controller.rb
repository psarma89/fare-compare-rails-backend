class Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:create, :show]

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      # issue that user a token
      token = issue_token(@user)
      render json: {id: @user.id, email: @user.email, jwt: token}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

  def show
    # token = request.headers['Authorization']
    # user = User.find_by(id: token)
    if logged_in?
      render json: current_user
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end

end
