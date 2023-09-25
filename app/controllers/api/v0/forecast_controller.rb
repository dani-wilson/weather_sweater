class Api::V0::ForecastController < ApplicationController
  def index
    if params[:location].blank?
      render json: { 'errors': 'No location specified' }, status: :bad_request
    else
      forecasts = WeatherFacade.weather(params[:location])
      render json: WeatherSerializer.new(forecasts)
    end
  end
end