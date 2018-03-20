class Api::V1::UbersController < ApplicationController

  skip_before_action :authorized, only: [:price, :product, :estimate]

  def product
    uberHeaders = {
      'Authorization' => ENV['uber_token'],
      'Accept-Language' => 'en_US',
      'Content-Type' => 'application/json'
    }

    response = JSON.parse(RestClient.get("https://api.uber.com/v1.2/products?latitude="+params[:source][:lat].to_s+"&longitude="+params[:source][:lng].to_s, headers=uberHeaders))

    render json: response
  end

  def price
    uberHeaders = {
      'Authorization' => ENV['uber_token'],
      'Accept-Language' => 'en_US',
      'Content-Type' => 'application/json'
    }

    response = JSON.parse(RestClient.get("https://api.uber.com/v1.2/estimates/price?start_latitude="+params[:source][:lat].to_s+"&start_longitude="+params[:source][:lng].to_s+"&end_latitude="+params[:destination][:lat].to_s+"&end_longitude="+params[:destination][:lng].to_s, headers=uberHeaders))

    render json: response
  end

  def location
    uberHeaders = {
      'Authorization' => ENV['uber_token'],
      'Accept-Language' => 'en_US',
      'Content-Type' => 'application/json'
    }

    response = JSON.parse(RestClient.get("https://api.uber.com/v1.2/estimates/time?start_latitude="+params[:source][:lat].to_s+"&start_longitude="+params[:source][:lng].to_s, headers=uberHeaders))


    render json: response
  end

end
