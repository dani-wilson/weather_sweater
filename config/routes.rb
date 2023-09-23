Rails.application.routes.draw do
  get '/api/v0/forecast', to: '/api/v0/forecast#index'
end
