Rails.application.routes.draw do
  get '/', to: 'api/v0/forecast#index'
end
