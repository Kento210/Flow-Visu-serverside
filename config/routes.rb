Rails.application.routes.draw do
  resources :tags, only: [:create]
  resources :statuses, only: [:index]
  resources :logs, only: [:index]
  get '/ping', to: 'system#ping'
  post '/ping', to: 'system#ping'
end

