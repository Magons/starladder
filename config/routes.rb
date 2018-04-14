Rails.application.routes.draw do
  resources :teams, except: [:show]
  resources :tournaments, only: [:index, :show]
  root to: 'teams#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
