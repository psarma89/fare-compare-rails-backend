class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:create, :update]

  def create
  end

  def update
  end
end
