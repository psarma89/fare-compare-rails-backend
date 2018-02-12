class Api::V1::TaxisController < ApplicationController

  def fare
    response = JSON.parse(RestClient.get("https://api.taxifarefinder.com/fare?key="+ENV['taxi_api_key']+"&origin="+params[:source][:lat].to_s+","+params[:source][:lng].to_s+"&destination="+params[:destination][:lat].to_s+","+params[:destination][:lng].to_s))

    render json: response
  end

end
