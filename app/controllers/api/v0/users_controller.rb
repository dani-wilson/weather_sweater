class Api::V0::UsersController < ApplicationController
  def create
    if params[:email].empty? || params[:password].empty? || params[:password_confirmation].empty?
      render json: { 'error': 'Missing required information: Fields cannot be blank' }, status: :bad_request
    elsif User.exists?(email: params[:email])
      render json: { 'error': 'An account with this email already exists' }, status: :bad_request
    elsif params[:password] != params[:password_confirmation]
      render json: { 'error': 'Passwords do not match' }, status: :bad_request
    else 
      user = User.create!(user_params.merge(api_key: set_api_key))
      render json: UserSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def set_api_key
    SecureRandom.base58(24)
  end
end