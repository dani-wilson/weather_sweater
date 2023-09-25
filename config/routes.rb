Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :forecast, only: :index
      resources :users, only: [:new, :create]
    end
  end
end
