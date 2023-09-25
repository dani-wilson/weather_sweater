class Api::V1::BookSearchController < ApplicationController
  def index
  information = OpenlibraryFacade.find_book(params[:location], params[:quantity])
  render json: OpenlibrarySerializer.new(information).as_json
  end
end