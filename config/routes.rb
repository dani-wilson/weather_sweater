Rails.application.routes.draw do
  get '/api/v0/forecast', to: 'api/v0/forecast#index'
  # get '/api/v1/book_search', to: '/api/v1/book_search#index'
end
