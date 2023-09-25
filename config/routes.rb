Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :book_search, only: :index
    end
  end
end
