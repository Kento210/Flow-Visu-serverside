Rails.application.routes.draw do
  get '/ping', to: 'ping#index'
  post '/tag', to: 'tags#create'
  get '/status', to: 'statuses#index'
  get '/logs', to: 'logs#index'

  resources :tags, only: [:create]
  resources :statuses, only: [:index]
  resources :logs, only: [:index]
  resources :statuses, only: [:destroy]
  get '/ping', to: 'system#ping'
  post '/ping', to: 'system#ping'
end
