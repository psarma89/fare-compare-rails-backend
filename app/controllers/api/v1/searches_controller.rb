class Api::V1::SearchesController < ApplicationController

  def create
    search = Search.new({user_id: current_user.id, address: params[:address]})

    if search.save
      addresses = Search.where(user_id: current_user.id).group(:address).order('count_id desc').count('id').first(5)
      render json: addresses
    else
      render json: { error: search.errors.full_messages[0] }
    end
  end

  def index
    # debugger
    addresses = Search.where(user_id: current_user.id).group(:address).order('count_id desc').count('id').first(5)

    render json: addresses
  end

  private

  def search_params
    params.permit(:address)
  end

end
