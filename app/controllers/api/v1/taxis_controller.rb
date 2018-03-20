class Api::V1::TaxisController < ApplicationController
  before_action :authorized

  def fare
    response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/fare?key="+ENV['taxi_api_key']+"&origin="+params[:source][:lat].to_s+","+params[:source][:lng].to_s+"&destination="+params[:destination][:lat].to_s+","+params[:destination][:lng].to_s))

    render json: response
  end

  def business
    # debugger
    entity = JSON.parse(RestClient.get("https://api.taxifarefinder.com/entity?key="+ENV['taxi_api_key']+"&location="+params[:source][:lat].to_s+","+params[:source][:lng].to_s))["handle"]

    if entity
      response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/businesses?key="+ENV['taxi_api_key']+"&entity_handle="+entity))

      render json: response
    else
      render json: {}
    end
  end

end
