class Api::V0::RoadTripController < ApplicationController
  def create
    if params[:origin].blank? || params[:destination].blank? || params[:api_key].blank?
      render json: { 'error': 'Fields cannot be blank' }, status: 401
    else
      render json: RoadTripSerializer.new(roadtrip), status: 201
    end
  end

  private

  def roadtrip
    RoadTripFacade.road_trip(params[:origin], params[:destination])
  end
end