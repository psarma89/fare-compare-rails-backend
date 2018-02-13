class Api::V1::TaxisController < ApplicationController
  skip_before_action :authorized, only: [:fare, :business]

  def fare
    response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/fare?key="+ENV['taxi_api_key']+"&origin="+params[:source][:lat].to_s+","+params[:source][:lng].to_s+"&destination="+params[:destination][:lat].to_s+","+params[:destination][:lng].to_s))

    render json: response
  end

  def business
    # debugger
    entity = JSON.parse(RestClient.get("https://api.taxifarefinder.com/entity?key="+ENV['taxi_api_key']+"&location="+params[:source][:lat].to_s+","+params[:source][:lng].to_s))["handle"]

    response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/businesses?key="+ENV['taxi_api_key']+"&entity_handle="+entity))

    render json: response
  end

end
