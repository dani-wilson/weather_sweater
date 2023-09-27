class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: { 'error': 'No such user exists' }, status: 400
    elsif !user.nil?
      render json: UserSerializer.new(user)
    else
      render json: { 'error': 'Something went wrong' }
    end
  end
end