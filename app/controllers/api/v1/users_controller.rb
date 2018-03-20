class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:create, :update]

  def create
    @user = User.new(user_params)
    # debugger

    if @user.save
      token = issue_token(@user)
      render json: {id: @user.id, email: @user.email, jwt: token}
    else
      render json: { error: @user.errors.full_messages[0] }
    end
  end

  def update
    if params[:email] == ""
      render json: { error: "Enter an email"}
    elsif params[:password] == ""
      render json: { error: "Enter a new password"}
    else
      @user = User.find_by(email: params[:email])
      if @user.update(password: params[:password])
        token = issue_token(@user)
        render json: {id: @user.id, email: @user.email, jwt: token}
      else
        render json: { error: @user.errors.full_messages[0] }
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
