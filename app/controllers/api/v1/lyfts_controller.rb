class Api::V1::LyftsController < ApplicationController
  before_action :authorized

  def product
    lyftHeaders = {
      "Authorization" => ENV['lyft_bearer_token'],
      "Content-Type" => "application/json"
    }

    response = JSON.parse(RestClient.get("https://api.lyft.com/v1/ridetypes?lat="+params[:source][:lat].to_s+"&lng="+params[:source][:lng].to_s, headers=lyftHeaders))

    render json: response
  end

  def estimate
    lyftHeaders = {
      "Authorization" => ENV['lyft_bearer_token'],
      "Content-Type" => "application/json"
    }

    response = JSON.parse(RestClient.get("https://api.lyft.com/v1/eta?lat="+params[:source][:lat].to_s+"&lng="+params[:source][:lng].to_s, headers=lyftHeaders))

    render json: response
  end

  def location
    lyftHeaders = {
      "Authorization" => ENV['lyft_bearer_token'],
      "Content-Type" => "application/json"
    }

    response = JSON.parse(RestClient.get("https://api.lyft.com/v1/nearby-drivers-pickup-etas?lat="+params[:source][:lat].to_s+"&lng="+params[:source][:lng].to_s, headers=lyftHeaders))

    render json: response
  end

  def price
    lyftHeaders = {
      "Authorization" => ENV['lyft_bearer_token'],
      "Content-Type" => "application/json"
    }

    response = JSON.parse(RestClient.get("https://api.lyft.com/v1/cost?start_lat="+params[:source][:lat].to_s+"&start_lng="+params[:source][:lng].to_s+"&end_lat="+params[:destination][:lat].to_s+"&end_lng="+params[:destination][:lng].to_s, headers=lyftHeaders))

    render json: response
  end

end
