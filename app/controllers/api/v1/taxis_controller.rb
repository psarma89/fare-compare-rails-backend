class Api::V1::TaxisController < ApplicationController

  def fare
    response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/fare?key="+ENV['taxi_api_key']+"&origin="+params[:source][:lat]+","+params[:source][:lng]+"&destination="+params[:destination][:lat]+","+params[:destination][:lng]))

    render json: response
  end

end
